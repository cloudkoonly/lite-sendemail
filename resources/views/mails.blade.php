@extends('sendportal::layouts.app')
@push('css')
    <style>
        .mail-folder {
            cursor: pointer;
            transition: background-color 0.2s;
        }
        .mail-folder:hover, .mail-folder.active {
            background-color: #e9ecef;
        }
        .email-item {
            cursor: pointer;
            transition: background-color 0.2s;
        }
        .email-item:hover {
            background-color: #f8f9fa;
        }
        .hover-bg-light:hover {
            background-color: #f8f9fa;
        }
        .email-star {
            color: #dee2e6;
            cursor: pointer;
        }
        .email-star:hover {
            color: #ffc107;
        }
        .email-detail-content {
            min-height: calc(100vh - 250px);
        }
    </style>
@endpush
@section('heading')
    <div class="d-flex justify-content-between align-items-center">
        <div class="d-flex align-items-center">
            <input type="text" class="form-control" id="searchMail" placeholder="Search mail..." style="width: 300px;">
            <button class="btn btn-light ml-2" id="searchButton">
                <i class="fas fa-search"></i>
            </button>
        </div>
    </div>
@endsection

@section('content')
    <div class="container-fluid px-0">
        <div class="row no-gutters">
            <!-- Left Sidebar -->
            <div class="col-md-2 bg-light border-right" style="min-height: calc(100vh - 150px);">
                <div class="p-3">
                    <button class="btn btn-primary btn-block mb-4" id="composeBtn">
                        <i class="fas fa-plus mr-2"></i>Compose
                    </button>

                    <div class="mail-folders">
                        <div class="mail-folder active d-flex align-items-center p-2 rounded" data-folder="inbox">
                            <i class="fas fa-inbox mr-3"></i>
                            <span>Inbox</span>
                            <span class="badge badge-primary ml-auto">14</span>
                        </div>
                        <div class="mail-folder d-flex align-items-center p-2 rounded" data-folder="starred">
                            <i class="fas fa-star mr-3"></i>
                            <span>Starred</span>
                        </div>
                        <div class="mail-folder d-flex align-items-center p-2 rounded" data-folder="sent">
                            <i class="fas fa-paper-plane mr-3"></i>
                            <span>Sent</span>
                        </div>
                        <div class="mail-folder d-flex align-items-center p-2 rounded" data-folder="drafts">
                            <i class="fas fa-file mr-3"></i>
                            <span>Drafts</span>
                        </div>
                        <div class="mail-folder d-flex align-items-center p-2 rounded" data-folder="trash">
                            <i class="fas fa-trash mr-3"></i>
                            <span>Trash</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Email List and Detail View -->
            <div class="col-md-10">
                <!-- Email List View -->
                <div id="emailListView">
                    <div class="email-actions border-bottom p-3">
                        <div class="btn-group">
                            <button class="btn btn-light" id="archiveBtn">
                                <i class="fas fa-archive"></i>
                            </button>
                            <button class="btn btn-light" id="spamBtn">
                                <i class="fas fa-exclamation-circle"></i>
                            </button>
                            <button class="btn btn-light" id="deleteBtn">
                                <i class="fas fa-trash"></i>
                            </button>
                        </div>
                        <div class="btn-group ml-2">
                            <button class="btn btn-light" id="markReadBtn">
                                <i class="fas fa-envelope"></i>
                            </button>
                            <button class="btn btn-light" id="snoozeBtn">
                                <i class="fas fa-clock"></i>
                            </button>
                        </div>
                    </div>

                    <div class="email-list">
                        @foreach($emails ?? [] as $email)
                            <div class="email-item d-flex align-items-center border-bottom p-3 hover-bg-light" data-email-id="{{ $email->id ?? 1 }}">
                                <div class="custom-control custom-checkbox mr-3">
                                    <input type="checkbox" class="custom-control-input" id="email{{ $email->id ?? 1 }}">
                                    <label class="custom-control-label" for="email{{ $email->id ?? 1 }}"></label>
                                </div>
                                <div class="email-star mr-3">
                                    <i class="far fa-star"></i>
                                </div>
                                <div class="email-sender font-weight-bold" style="width: 200px;">
                                    {{ $email->sender ?? 'Sender Name' }}
                                </div>
                                <div class="email-subject flex-grow-1">
                                    <span class="font-weight-bold">{{ $email->subject ?? 'Email Subject' }}</span>
                                    <span class="text-muted">{{ $email->preview ?? 'Email preview text...' }}</span>
                                </div>
                                <div class="email-time text-muted" style="width: 100px;">
                                    {{ $email->created_at ?? date('M d') }}
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>

                <!-- Email Detail View (Hidden by default) -->
                <div id="emailDetailView" class="d-none">
                    <div class="email-detail-actions border-bottom p-3">
                        <button class="btn btn-light" id="backToList">
                            <i class="fas fa-arrow-left"></i>
                        </button>
                        <div class="btn-group ml-2">
                            <button class="btn btn-light" id="replyBtn">
                                <i class="fas fa-reply"></i>
                            </button>
                            <button class="btn btn-light" id="forwardBtn">
                                <i class="fas fa-forward"></i>
                            </button>
                            <button class="btn btn-light" id="detailDeleteBtn">
                                <i class="fas fa-trash"></i>
                            </button>
                        </div>
                    </div>
                    <div class="email-detail-content p-4">
                        <!-- Email content will be loaded here dynamically -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Compose Modal -->
    <div class="modal fade" id="composeModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Compose Email</h5>
                    <button type="button" class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="composeForm">
                        <div class="form-group">
                            <input type="text" class="form-control" id="emailTo" placeholder="To">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="emailSubject" placeholder="Subject">
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" id="emailContent" rows="10"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-dismiss="modal">Discard</button>
                    <button type="button" class="btn btn-light" id="saveDraft">Save Draft</button>
                    <button type="button" class="btn btn-primary" id="sendEmail">Send</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Reply Modal -->
    <div class="modal fade" id="replyModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Reply</h5>
                    <button type="button" class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="replyForm">
                        <div class="form-group">
                            <input type="text" class="form-control" id="replyTo" readonly>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="replySubject" readonly>
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" id="replyContent" rows="10"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-dismiss="modal">Discard</button>
                    <button type="button" class="btn btn-primary" id="sendReply">Send</button>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('js')
<script>
        $(document).ready(function() {
            // Global variables
            let currentEmailId = null;
            let currentFolder = 'inbox';

            // Load emails for a folder
            function loadEmails(folder) {
                $.ajax({
                    url: '/mails/list',
                    method: 'GET',
                    data: { folder: folder },
                    success: function(response) {
                        // Update email list
                        updateEmailList(response.emails);
                    }
                });
            }

            // Update email list view
            function updateEmailList(emails) {
                const emailList = $('.email-list');
                emailList.empty();

                emails.forEach(email => {
                    // Create email item HTML
                    const emailItem = `
                        <div class="email-item d-flex align-items-center border-bottom p-3 hover-bg-light" data-email-id="${email.id}">
                            <div class="custom-control custom-checkbox mr-3">
                                <input type="checkbox" class="custom-control-input" id="email${email.id}">
                                <label class="custom-control-label" for="email${email.id}"></label>
                            </div>
                            <div class="email-star mr-3">
                                <i class="far fa-star ${email.starred ? 'fas text-warning' : ''}"></i>
                            </div>
                            <div class="email-sender font-weight-bold" style="width: 200px;">
                                ${email.sender}
                            </div>
                            <div class="email-subject flex-grow-1">
                                <span class="font-weight-bold">${email.subject}</span>
                                <span class="text-muted">${email.preview}</span>
                            </div>
                            <div class="email-time text-muted" style="width: 100px;">
                                ${email.created_at}
                            </div>
                        </div>
                    `;
                    emailList.append(emailItem);
                });
            }

            // Load email detail
            function loadEmailDetail(emailId) {
                $.ajax({
                    url: `/mails/${emailId}`,
                    method: 'GET',
                    success: function(response) {
                        showEmailDetail(response.email);
                    }
                });
            }

            // Show email detail
            function showEmailDetail(email) {
                $('#emailListView').addClass('d-none');
                $('#emailDetailView').removeClass('d-none');

                const detailContent = $('.email-detail-content');
                detailContent.html(`
                    <h4>${email.subject}</h4>
                    <div class="d-flex justify-content-between align-items-center my-3">
                        <div>
                            <strong>From:</strong> ${email.sender}
                            <br>
                            <strong>To:</strong> ${email.recipient}
                        </div>
                        <div class="text-muted">
                            ${email.created_at}
                        </div>
                    </div>
                    <div class="email-body mt-4">
                        ${email.content}
                    </div>
                `);

                currentEmailId = email.id;
            }

            // Compose email
            $('#composeBtn').click(function() {
                $('#composeModal').modal('show');
            });

            // Send email
            $('#sendEmail').click(function() {
                const emailData = {
                    to: $('#emailTo').val(),
                    subject: $('#emailSubject').val(),
                    content: $('#emailContent').val()
                };

                $.ajax({
                    url: '/mails',
                    method: 'POST',
                    data: emailData,
                    success: function(response) {
                        $('#composeModal').modal('hide');
                        loadEmails(currentFolder);
                        // Clear form
                        $('#composeForm')[0].reset();
                    }
                });
            });

            // Reply to email
            $('#replyBtn').click(function() {
                if (!currentEmailId) return;

                $.ajax({
                    url: `/mails/${currentEmailId}`,
                    method: 'GET',
                    success: function(response) {
                        const email = response.email;
                        $('#replyTo').val(email.sender);
                        $('#replySubject').val(`Re: ${email.subject}`);
                        $('#replyModal').modal('show');
                    }
                });
            });

            // Send reply
            $('#sendReply').click(function() {
                const replyData = {
                    to: $('#replyTo').val(),
                    subject: $('#replySubject').val(),
                    content: $('#replyContent').val(),
                    reply_to: currentEmailId
                };

                $.ajax({
                    url: '/mails/reply',
                    method: 'POST',
                    data: replyData,
                    success: function(response) {
                        $('#replyModal').modal('hide');
                        loadEmails(currentFolder);
                        // Clear form
                        $('#replyForm')[0].reset();
                    }
                });
            });

            // Delete email
            $('#deleteBtn, #detailDeleteBtn').click(function() {
                const selectedEmails = $('.custom-control-input:checked').map(function() {
                    return $(this).closest('.email-item').data('email-id');
                }).get();

                if ($(this).attr('id') === 'detailDeleteBtn') {
                    selectedEmails.push(currentEmailId);
                }

                if (selectedEmails.length === 0) return;

                if (confirm('Are you sure you want to delete the selected email(s)?')) {
                    $.ajax({
                        url: '/mails/delete',
                        method: 'POST',
                        data: { ids: selectedEmails },
                        success: function(response) {
                            if ($('#emailDetailView').is(':visible')) {
                                $('#backToList').click();
                            }
                            loadEmails(currentFolder);
                        }
                    });
                }
            });

            // Back to list
            $('#backToList').click(function() {
                $('#emailDetailView').addClass('d-none');
                $('#emailListView').removeClass('d-none');
                currentEmailId = null;
            });

            // Folder selection
            $('.mail-folder').click(function() {
                $('.mail-folder').removeClass('active');
                $(this).addClass('active');
                currentFolder = $(this).data('folder');
                loadEmails(currentFolder);
            });

            // Email item click
            $(document).on('click', '.email-item', function(e) {
                if (!$(e.target).is('.custom-control-input, .email-star, .fa-star')) {
                    const emailId = $(this).data('email-id');
                    loadEmailDetail(emailId);
                }
            });

            // Star/unstar
            $(document).on('click', '.email-star', function(e) {
                e.stopPropagation();
                const emailId = $(this).closest('.email-item').data('email-id');
                const star = $(this).find('i');
                const isStarred = star.hasClass('fas');

                $.ajax({
                    url: `/mails/${emailId}/star`,
                    method: 'POST',
                    data: { starred: !isStarred },
                    success: function(response) {
                        star.toggleClass('far fas text-warning');
                    }
                });
            });

            // Search
            $('#searchButton').click(function() {
                const query = $('#searchMail').val();
                if (!query) return;

                $.ajax({
                    url: '/mails/search',
                    method: 'GET',
                    data: { q: query },
                    success: function(response) {
                        updateEmailList(response.emails);
                    }
                });
            });

            // Initial load
            loadEmails('inbox');
        });
    </script>
@endpush
