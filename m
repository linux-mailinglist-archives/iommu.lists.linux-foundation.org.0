Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id D55FF35B6F5
	for <lists.iommu@lfdr.de>; Sun, 11 Apr 2021 23:08:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4894B82FD7;
	Sun, 11 Apr 2021 21:08:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AodM4QFD08bl; Sun, 11 Apr 2021 21:08:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69CAF82F40;
	Sun, 11 Apr 2021 21:08:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4541BC0012;
	Sun, 11 Apr 2021 21:08:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 530EBC000A
 for <iommu@lists.linux-foundation.org>; Sun, 11 Apr 2021 21:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48CCE606A8
 for <iommu@lists.linux-foundation.org>; Sun, 11 Apr 2021 21:08:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qOD75CeXSS9P for <iommu@lists.linux-foundation.org>;
 Sun, 11 Apr 2021 21:08:19 +0000 (UTC)
X-Greylist: delayed 09:29:32 by SQLgrey-1.8.0
Received: from smtprelay.hostedemail.com (smtprelay0252.hostedemail.com
 [216.40.44.252])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E14E606A6
 for <iommu@lists.linux-foundation.org>; Sun, 11 Apr 2021 21:08:19 +0000 (UTC)
Received: from omf16.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id EBD491DF1;
 Sun, 11 Apr 2021 21:08:17 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf16.hostedemail.com (Postfix) with ESMTPA id 532C12550F1; 
 Sun, 11 Apr 2021 21:08:16 +0000 (UTC)
Message-ID: <9a9246c417587f17009543f8048d5f9b7a2ed68f.camel@perches.com>
Subject: Re: [PATCH] iommu/amd: Fix extended features logging
From: Joe Perches <joe@perches.com>
To: John Ogness <john.ogness@linutronix.de>, Alexander Monakov
 <amonakov@ispras.ru>
Date: Sun, 11 Apr 2021 14:08:14 -0700
In-Reply-To: <87o8ekioo4.fsf@jogness.linutronix.de>
References: <20210410211152.1938-1-amonakov@ispras.ru>
 <e884200f-55a4-59b5-4311-964e6ddc94d1@molgen.mpg.de>
 <alpine.LNX.2.20.13.2104111410340.11104@monopod.intra.ispras.ru>
 <87o8ekioo4.fsf@jogness.linutronix.de>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 532C12550F1
X-Stat-Signature: eagcefjgbbk7hk8ng65r7rhy6cygbpet
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/lZU62XoRvdiKemSYJQ3VV6E25IAI9M3o=
X-HE-Tag: 1618175296-55556
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Joerg Roedel <jroedel@suse.de>,
 Petr Mladek <pmladek@suse.com>, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 iommu@lists.linux-foundation.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Sun, 2021-04-11 at 21:52 +0200, John Ogness wrote:
> I'd rather fix dev_info callers to allow pr_cont and then fix any code
> that is using this workaround.

Assuming you mean all dev_<level>() uses, me too.

> And if the print maintainers agree it is OK to encourage
> pr_cont(LOGLEVEL "...") usage, then people should really start using
> that if the loglevel on those pieces is important.

I have no stong feeling about the use of pr_cont(<KERN_LEVEL>
as valuable or not.  I think it's just a trivial bit that
could be somewhat useful when interleaving occurs.

A somewhat better mechanism would be to have an explicit
cookie use like:

	cookie = printk_multipart_init(KERN_LEVEL, fmt, ...);
	while (<condition>)
		printk_multipart_cont(cookie, fmt, ...);
	printk_multipark_end(cookie, fmt, ...);

And separately, there should be a pr_debug_cont or equivalent.


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
