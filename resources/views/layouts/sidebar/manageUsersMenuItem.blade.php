@auth()
    @if (auth()->user()->ownsCurrentWorkspace())
        <li class="nav-item {{ request()->is('users*') ? 'active' : '' }}">
            <a class="nav-link" href="{{ route('users.index') }}">
                <i class="fa-fw fas fa-users mr-2"></i><span>{{ __('Manage Users') }}</span>
            </a>
        </li>
    @endif
@endauth
<li class="nav-item {{ request()->is('*mails*') ? 'active' : '' }}">
    <a class="nav-link" href="{{ route('mails') }}">
        <i class="fa-fw fas fa-envelope mr-2"></i><span>Mails</span>
    </a>
</li>
