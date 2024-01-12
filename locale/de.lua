local Translations = {
    error = {
        not_online = 'Der Spieler ist nicht online',
        wrong_format = 'Falsches Format',
        missing_args = 'Nicht alle Argumente wurden angegeben (x, y, z).',
        missing_args2 = 'Alle Argumente müssen angegeben werden.',
        no_access = 'Kein Zugriff auf diesen Befehl',
        company_too_poor = 'Dein Arbeitgeber hat kein Geld mehr.',
        item_not_exist = 'Der Gegenstand existiert nicht.',
        too_heavy = 'Inventar zu voll.',
        location_not_exist = 'Der Ort existiert nicht.',
        duplicate_license = 'Doppelte Rockstar-Lizenz gefunden.',
        no_valid_license  = 'Keine verifizierte Rockstar-Lizenz gefunden.',
        not_whitelisted = 'Du bist nicht auf der Allowlist.',
        server_already_open = 'Der Server ist schon offen.',
        server_already_closed = 'Der Server ist schon geschlossen.',
        no_permission = 'Du hast keine Berechtigung für diese Aktion.',
        no_waypoint = 'Du hast keinen Wegpunkt gesetzt.',
        tp_error = 'Fehler beim Teleportieren.',
    },
    success = {
        server_opened = 'Der Server wurde geöffnet.',
        server_closed = 'Der Server wurde geschlossen.',
        teleported_waypoint = 'Zum Wegpunkt teleportiert.',
    },
    info = {
        received_paycheck = 'Du hast dein Gehalt in Höhe von $%{value} erhalten',
        job_info = 'Beruf: %{value} | Dienstgrad: %{value2} | Dienststatus: %{value3}',
        gang_info = 'Gang: %{value} | Rang: %{value2}',
        on_duty = 'Du befindest dich nun im Dienst.',
        off_duty = 'Du befindest dich nicht mehr im Dienst.',
        checking_ban = 'Hallo %s. Wir überprüfen, ob du gebannt bist.',
        join_server = 'Willkommen %s auf {Server Name}.',
        checking_whitelisted = 'Hallo %s. Wir überprüfen, ob du auf der Allowlist bist.',
        exploit_banned = 'Du wurdest wegen Cheating gebannt. Melde dich auf unseren Discord: %{discord}',
        exploit_dropped = 'Du wurdest gekickt, für das Ausnutzen von Fehlern.',
    },
    command = {
        tp = {
            help = 'Teleport zu Spieler oder Koordinaten (Nur Admins)',
            params = {
                x = { name = 'id/x', help = 'ID vom Spieler oder X position'},
                y = { name = 'y', help = 'Y position'},
                z = { name = 'z', help = 'Z position'},
            },
        },
        tpm = { help = 'Teleport zum Wegpunkt (Nur Admins)' },
        togglepvp = { help = 'PVP ein- oder ausschalten (Nur Admins)' },
        addpermission = {
            help = 'Spieler Berechtigungen geben (God Only)',
            params = {
                id = { name = 'id', help = 'ID des Spielers' },
                permission = { name = 'permission', help = 'Berechtigung' },
            },
        },
        removepermission = {
            help = 'Spieler Berechtigungen entfernen (God Only)',
            params = {
                id = { name = 'id', help = 'ID des Spielers' },
                permission = { name = 'permission', help = 'Berechtigung' },
            },
        },
        openserver = { help = 'Server für jeden öffnen (Nur Admins)' },
        closeserver = {
            help = 'Server für jeden ohne Rechte schließen (Nur Admins)',
            params = {
                reason = { name = 'reason', help = 'Schließungsgrund (optional)' },
            },
        },
        car = {
            help = 'Erstelle ein Fahrzeug (Nur Admins)',
            params = {
                model = { name = 'model', help = 'Modell' },
            },
        },
        dv = { help = 'Fahrzeug löschen (Nur Admins)' },
        givemoney = {
            help = 'Gib einem Spieler Geld (Nur Admins)',
            params = {
                id = { name = 'id', help = 'Spieler ID' },
                moneytype = { name = 'moneytype', help = 'Geldtyp (Bargeld, Bank, Crypto)' },
                amount = { name = 'amount', help = 'Geldmenge' },
            },
        },
        setmoney = {
            help = 'Setze die Geldmenge von einem Spieler (Nur Admins)',
            params = {
                id = { name = 'id', help = 'Spieler ID' },
                moneytype = { name = 'moneytype', help = 'Geldtyp' },
                amount = { name = 'amount', help = 'Geldmenge' },
            },
        },
        job = { help = 'Zeigt dein aktuellen Job an.' },
        setjob = {
            help = 'Spieler einen Job zuweisen (Nur Admins)',
            params = {
                id = { name = 'id', help = 'Spieler ID' },
                job = { name = 'job', help = 'Job Name' },
                grade = { name = 'grade', help = 'Dienstgrad' },
            },
        },
        gang = { help = 'Zeigt deine aktuelle Gang an.' },
        setgang = {
            help = 'Spieler einer Gang zuweisen (Nur Admins)',
            params = {
                id = { name = 'id', help = 'Spieler ID' },
                gang = { name = 'gang', help = 'Gang Name' },
                grade = { name = 'grade', help = 'Gang Rang' },
            },
        },
        ooc = { help = 'OOC Nachricht' },
        me = {
            help = 'Lokale Nachricht',
            params = {
                message = { name = 'message', help = 'Nachricht' }
            },
        },
    },
}

if GetConvar('qb_locale', 'en') == 'de' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
