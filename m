Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC2D1EE0F9
	for <lists.iommu@lfdr.de>; Thu,  4 Jun 2020 11:16:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5653A81EBC;
	Thu,  4 Jun 2020 09:16:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ec-onhyjPFGp; Thu,  4 Jun 2020 09:16:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DEADB8790F;
	Thu,  4 Jun 2020 09:16:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C24A2C016E;
	Thu,  4 Jun 2020 09:16:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B0F9C016E
 for <iommu@lists.linux-foundation.org>; Thu,  4 Jun 2020 09:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0169888079
 for <iommu@lists.linux-foundation.org>; Thu,  4 Jun 2020 09:16:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V-VZOkzh+DbH for <iommu@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 09:16:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 06FE985B48
 for <iommu@lists.linux-foundation.org>; Thu,  4 Jun 2020 09:16:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 51022AB87;
 Thu,  4 Jun 2020 09:16:25 +0000 (UTC)
Date: Thu, 4 Jun 2020 11:16:19 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Jerry Snitselaar <jsnitsel@redhat.com>
Subject: Re: [PATCH] iommu: Don't attach deferred device in
 iommu_group_do_dma_attach
Message-ID: <20200604091619.GO6857@suse.de>
References: <20200604073142.74701-1-jsnitsel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200604073142.74701-1-jsnitsel@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

Hi Jerry,

On Thu, Jun 04, 2020 at 12:31:42AM -0700, Jerry Snitselaar wrote:
> Attaching a deferred device should be delayed until dma api is called.
> 
> Cc: iommu@lists.linux-foundation.org
> Suggested-by: Joerg Roedel <jroedel@suse.de>
> Signed-off-by: Jerry Snitselaar <jsnitsel@redhat.com>
> ---
> If you already have thrown a patch together, then ignore this. Also
> feel free to swap out the signed-off-by with your's since
> this is more your patch than mine. You can put a reviewed-by
> and tested-by instead for me.

Yeah, I already have a patch, just not sent out yet. I updated it with
your tags and will send it out shortly.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
