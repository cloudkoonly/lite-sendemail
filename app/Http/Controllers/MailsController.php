<?php

declare(strict_types=1);

namespace App\Http\Controllers;

use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Carbon;
use Illuminate\View\View;
use Illuminate\Http\Request;

class MailsController extends Controller
{
    private $mockEmails = [];

    public function __construct()
    {

        // Generate mock emails
        $this->mockEmails = collect([
            [
                'id' => 1,
                'sender' => 'john.doe@example.com',
                'recipient' => 'me@sendportal.com',
                'subject' => 'Welcome to SendPortal',
                'preview' => 'Thank you for choosing SendPortal for your email marketing needs...',
                'content' => '<p>Dear User,</p><p>Thank you for choosing SendPortal for your email marketing needs. We are excited to have you on board!</p><p>With SendPortal, you can:</p><ul><li>Send beautiful email campaigns</li><li>Track email metrics</li><li>Manage subscribers</li></ul><p>Best regards,<br>The SendPortal Team</p>',
                'created_at' => '2025-03-07 10:00',
                'starred' => true,
                'folder' => 'inbox',
                'read' => false
            ],
            [
                'id' => 2,
                'sender' => 'marketing@company.com',
                'recipient' => 'me@sendportal.com',
                'subject' => 'March Newsletter',
                'preview' => 'Check out our latest updates and features for March...',
                'content' => '<h2>March Newsletter</h2><p>Here are our latest updates:</p><ul><li>New email templates</li><li>Improved tracking</li><li>Better spam protection</li></ul>',
                'created_at' => '2025-03-07 09:30',
                'starred' => false,
                'folder' => 'inbox',
                'read' => true,

            ],
            [
                'id' => 3,
                'sender' => 'me@sendportal.com',
                'recipient' => 'client@example.com',
                'subject' => 'Project Update',
                'preview' => 'Here is the latest update on the project progress...',
                'content' => '<p>Hi,</p><p>I wanted to update you on the project progress. We have completed the following:</p><ul><li>Phase 1: Complete</li><li>Phase 2: In Progress</li></ul>',
                'created_at' => '2025-03-07 08:45',
                'starred' => false,
                'folder' => 'sent',
                'read' => true,

            ],
            [
                'id' => 4,
                'sender' => 'support@service.com',
                'recipient' => 'me@sendportal.com',
                'subject' => 'Your Support Ticket #123',
                'preview' => 'Your support ticket has been resolved...',
                'content' => '<p>Hello,</p><p>Your support ticket #123 has been resolved. If you have any further questions, please don\'t hesitate to contact us.</p>',
                'created_at' => '2025-03-06 15:20',
                'starred' => false,
                'folder' => 'inbox',
                'read' => false,

            ],
            [
                'id' => 5,
                'sender' => 'me@sendportal.com',
                'recipient' => 'team@company.com',
                'subject' => 'Team Meeting Notes',
                'preview' => 'Here are the notes from our team meeting...',
                'content' => '<p>Team,</p><p>Here are the key points from our meeting:</p><ul><li>Q2 Goals review</li><li>New feature planning</li><li>Team updates</li></ul>',
                'created_at' => '2025-03-06 14:00',
                'starred' => true,
                'folder' => 'drafts',
                'read' => true,

            ]
        ]);
    }

    /**
     * @return View|RedirectResponse
     */
    public function index()
    {
        return view('mails');
    }

    public function list(Request $request)
    {
        $folder = $request->get('folder', 'inbox');
        $emails = $this->mockEmails
            ->where('folder', $folder)
            ->values();

        return response()->json(['emails' => $emails]);
    }

    public function show($id)
    {
        $email = $this->mockEmails
            ->firstWhere('id', (int)$id);

        if (!$email) {
            return response()->json(['error' => 'Email not found'], 404);
        }

        return response()->json(['email' => $email]);
    }

    public function store(Request $request)
    {
        $newEmail = [
            'id' => $this->mockEmails->max('id') + 1,
            'sender' => 'me@sendportal.com',
            'recipient' => $request->input('to'),
            'subject' => $request->input('subject'),
            'preview' => substr($request->input('content'), 0, 100),
            'content' => $request->input('content'),
            'created_at' => Carbon::now()->format('Y-m-d H:i'),
            'starred' => false,
            'folder' => 'sent',
            'read' => true,

        ];

        $this->mockEmails->push($newEmail);

        return response()->json(['message' => 'Email sent successfully', 'email' => $newEmail]);
    }

    public function reply(Request $request)
    {
        $originalEmail = $this->mockEmails
            ->firstWhere('id', (int)$request->input('reply_to'));

        if (!$originalEmail) {
            return response()->json(['error' => 'Original email not found'], 404);
        }

        $replyEmail = [
            'id' => $this->mockEmails->max('id') + 1,
            'sender' => 'me@sendportal.com',
            'recipient' => $originalEmail['sender'],
            'subject' => $request->input('subject'),
            'preview' => substr($request->input('content'), 0, 100),
            'content' => $request->input('content'),
            'created_at' => Carbon::now()->format('Y-m-d H:i'),
            'starred' => false,
            'folder' => 'sent',
            'read' => true,

        ];

        $this->mockEmails->push($replyEmail);

        return response()->json(['message' => 'Reply sent successfully', 'email' => $replyEmail]);
    }

    public function delete(Request $request)
    {
        $ids = $request->input('ids', []);

        foreach ($ids as $id) {
            $index = $this->mockEmails->search(function ($email) use ($id) {
                return $email['id'] === (int)$id;
            });

            if ($index !== false) {
                $email = $this->mockEmails->get($index);
                $email['folder'] = 'trash';
                $this->mockEmails->put($index, $email);
            }
        }

        return response()->json(['message' => 'Emails moved to trash']);
    }

    public function star(Request $request, $id)
    {
        $index = $this->mockEmails->search(function ($email) use ($id) {
            return $email['id'] === (int)$id;
        });

        if ($index === false) {
            return response()->json(['error' => 'Email not found'], 404);
        }

        $email = $this->mockEmails->get($index);
        $email['starred'] = $request->input('starred', true);
        $this->mockEmails->put($index, $email);

        return response()->json(['message' => 'Email starred status updated']);
    }

    public function search(Request $request)
    {
        $query = strtolower($request->get('q', ''));

        $emails = $this->mockEmails
            ->filter(function ($email) use ($query) {
                return str_contains(strtolower($email['subject']), $query) ||
                       str_contains(strtolower($email['sender']), $query) ||
                       str_contains(strtolower($email['content']), $query);
            })
            ->values();

        return response()->json(['emails' => $emails]);
    }
}
