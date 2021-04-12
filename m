Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6951B35C48C
	for <lists.iommu@lfdr.de>; Mon, 12 Apr 2021 12:59:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5A7A403C3;
	Mon, 12 Apr 2021 10:59:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2mg-F_5W9o4q; Mon, 12 Apr 2021 10:59:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id D98C04020A;
	Mon, 12 Apr 2021 10:59:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BF2EBC0011;
	Mon, 12 Apr 2021 10:59:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93AEDC000A
 for <iommu@lists.linux-foundation.org>; Mon, 12 Apr 2021 10:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71E3782D62
 for <iommu@lists.linux-foundation.org>; Mon, 12 Apr 2021 10:59:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AnbOVLXgxFQG for <iommu@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 10:59:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C90CF82D61
 for <iommu@lists.linux-foundation.org>; Mon, 12 Apr 2021 10:59:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1618225191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FIwJ2o1ChvUTQac2QV6kY4C/JqzebedAs3YH2KsUrwk=;
 b=uQXF9AGnwE8HshC8CP3Jun+axKZdGLySEhwpcbWGJ7G2LHJi1HDujPh78vSSRndZ7LY4Ir
 voyMDDET7bbqJ/RrmB1sEhmVrnoD5enId5gB+SOFJALpflmMcQcdnou3PaS5MUBJkaggMP
 LnNFj32K0RIzJWwuqYM7vw78d9fBPfU=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 41133AEFE;
 Mon, 12 Apr 2021 10:59:51 +0000 (UTC)
Date: Mon, 12 Apr 2021 12:59:50 +0200
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] iommu/amd: Fix extended features logging
Message-ID: <YHQoJtUOh7A1k1PF@alley>
References: <20210410211152.1938-1-amonakov@ispras.ru>
 <e884200f-55a4-59b5-4311-964e6ddc94d1@molgen.mpg.de>
 <alpine.LNX.2.20.13.2104111410340.11104@monopod.intra.ispras.ru>
 <87o8ekioo4.fsf@jogness.linutronix.de>
 <9a9246c417587f17009543f8048d5f9b7a2ed68f.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9a9246c417587f17009543f8048d5f9b7a2ed68f.camel@perches.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Joerg Roedel <jroedel@suse.de>,
 John Ogness <john.ogness@linutronix.de>,
 Alexander Monakov <amonakov@ispras.ru>, LKML <linux-kernel@vger.kernel.org>,
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
From: Petr Mladek via iommu <iommu@lists.linux-foundation.org>
Reply-To: Petr Mladek <pmladek@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Sun 2021-04-11 14:08:14, Joe Perches wrote:
> On Sun, 2021-04-11 at 21:52 +0200, John Ogness wrote:
> > I'd rather fix dev_info callers to allow pr_cont and then fix any code
> > that is using this workaround.
> 
> Assuming you mean all dev_<level>() uses, me too.
> 
> > And if the print maintainers agree it is OK to encourage
> > pr_cont(LOGLEVEL "...") usage, then people should really start using
> > that if the loglevel on those pieces is important.
> 
> I have no stong feeling about the use of pr_cont(<KERN_LEVEL>
> as valuable or not.  I think it's just a trivial bit that
> could be somewhat useful when interleaving occurs.
> 
> A somewhat better mechanism would be to have an explicit
> cookie use like:
> 
> 	cookie = printk_multipart_init(KERN_LEVEL, fmt, ...);
> 	while (<condition>)
> 		printk_multipart_cont(cookie, fmt, ...);
> 	printk_multipark_end(cookie, fmt, ...);
> 
> And separately, there should be a pr_debug_cont or equivalent.

We would need to implement this a lockless way. It is doable,
for example, using some per-CPU X per-context buffers. Which would
require to disable preemption in the section.

But I think that using dev_cont_info() would be easier after all.

That said, some printk_*_init()/end() API would be useful
for storing the pieces in a temporary buffer. It would allow
to store the entire lines without the risk of interleaving
with other messages.

Best Regards,
Petr
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
