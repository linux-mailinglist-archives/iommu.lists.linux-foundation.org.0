Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F041F84C6
	for <lists.iommu@lfdr.de>; Sat, 13 Jun 2020 20:54:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4BB3A8831B;
	Sat, 13 Jun 2020 18:54:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KBGKL8Kj4NHS; Sat, 13 Jun 2020 18:54:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D7ED9886EC;
	Sat, 13 Jun 2020 18:54:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A78C6C089E;
	Sat, 13 Jun 2020 18:54:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17D0EC016F
 for <iommu@lists.linux-foundation.org>; Sat, 13 Jun 2020 18:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 06437895BD
 for <iommu@lists.linux-foundation.org>; Sat, 13 Jun 2020 18:54:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wrbhwl1B3KkQ for <iommu@lists.linux-foundation.org>;
 Sat, 13 Jun 2020 18:54:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 962A4895B3
 for <iommu@lists.linux-foundation.org>; Sat, 13 Jun 2020 18:54:52 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 3264A2D8; Sat, 13 Jun 2020 20:54:49 +0200 (CEST)
Date: Sat, 13 Jun 2020 20:54:47 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [git pull] iommu: Move Intel and AMD drivers to a subdirectory
Message-ID: <20200613185447.GC3701@8bytes.org>
References: <20200612152205.GA18833@8bytes.org>
 <CAHk-=whtWYyUWP2Us3ZnOQB8i=C6JkVRZ7EG74rVY3K2v-gKaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=whtWYyUWP2Us3ZnOQB8i=C6JkVRZ7EG74rVY3K2v-gKaQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu <iommu@lists.linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Fri, Jun 12, 2020 at 12:23:49PM -0700, Linus Torvalds wrote:
> Looks good to me. Any time a directory starts to have a lot of
> filenames with a particular prefix, moving them deeper like this seems
> to make sense. And doing it just before the -rc1 release and avoiding
> unnecessary conflicts seems like the right time too.
> 
> So pulled.

Thanks!

> Looking at it, it might even be worth moving the Kconfig and Makefile
> details down to the intel/amd subdirectories, and have them be
> included from the main iommu ones? But that's up to you.

Yeah, right. Its cleaner to move the Kconfig and Makefile stuff a level
deeper too, I'll take care of that for v5.9.


	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
