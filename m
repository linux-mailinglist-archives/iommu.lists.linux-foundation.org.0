Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B8F2FBBC0
	for <lists.iommu@lfdr.de>; Tue, 19 Jan 2021 16:56:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DC591857C3;
	Tue, 19 Jan 2021 15:56:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yRYl55RnmR5u; Tue, 19 Jan 2021 15:56:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C1FE885EA2;
	Tue, 19 Jan 2021 15:56:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B508AC013A;
	Tue, 19 Jan 2021 15:56:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1E503C013A
 for <iommu@lists.linux-foundation.org>; Tue, 19 Jan 2021 15:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 09CA28517E
 for <iommu@lists.linux-foundation.org>; Tue, 19 Jan 2021 15:56:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xrwE0GsDFs-1 for <iommu@lists.linux-foundation.org>;
 Tue, 19 Jan 2021 15:56:13 +0000 (UTC)
X-Greylist: delayed 00:10:05 by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 653D985184
 for <iommu@lists.linux-foundation.org>; Tue, 19 Jan 2021 15:56:13 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 1626C450; Tue, 19 Jan 2021 16:46:05 +0100 (CET)
Date: Tue, 19 Jan 2021 16:46:01 +0100
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: IOMMU Maintainership
Message-ID: <20210119154601.GA3229@8bytes.org>
References: <20201117100953.GR22888@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117100953.GR22888@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Will Deacon <will@kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>
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

On Tue, Nov 17, 2020 at 11:09:53AM +0100, Joerg Roedel wrote:
> Hi,
> 
> last week I spent in the hospital and had an unplanned surgery from
> which I am recovering now. The recovery will take a few weeks, which
> unfortunatly does not allow me to fulfill my IOMMU maintainer duties or
> do any other serious work in front of a computer.
> 
> Luckily Will Deacon volunteered to handle incoming IOMMU patches and
> send them upstream. So please Cc him on any patches that you want to
> have merged upstream for the next release and on important fixes for
> v5.10. The patches will go through another tree for the time being, Will
> can share the details on that.

I am happy to announce that my recovery has gone well and I can now
return to my duties as the maintainer for IOMMU. Will already sent me a
list of pending stuff I will go through soon.

Thanks a lot to everyone who helped to keep things going through my
absence, and especially Will Deacon who picked up the work to collect
everything and sending it upstream!


Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
