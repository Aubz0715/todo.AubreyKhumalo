<nav class="navbar navbar-expand-sm bg-light navbar-purple">
<div class="topnav-centered">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/"> Schedule </a>
    </div>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
            <div class="nav-centered">
                <a class="nav-link" href="${pageContext.request.contextPath}/todo/create">+ Add Schedule</a>
                <select id = "Todo">
                   <option value = "Tasks"> Tasks </option>
                   <option value = "Create"> Create </option>
                   <option value = "Features"> Features </option>
                </select>
            </div>
            </li>
        </ul>
    </div>
</nav>

