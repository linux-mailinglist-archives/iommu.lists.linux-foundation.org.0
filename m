Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1AE307453
	for <lists.iommu@lfdr.de>; Thu, 28 Jan 2021 12:04:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E2FD686AEB;
	Thu, 28 Jan 2021 11:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I-KfnBnbD6FR; Thu, 28 Jan 2021 11:04:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 99F2D86B4A;
	Thu, 28 Jan 2021 11:04:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B273C013A;
	Thu, 28 Jan 2021 11:04:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9274C013A
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 11:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A5B6A873B2
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 11:04:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E6nnvP9WP9LI for <iommu@lists.linux-foundation.org>;
 Thu, 28 Jan 2021 11:04:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 33FE1873AD
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 11:04:16 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 4B07C51D; Thu, 28 Jan 2021 12:04:13 +0100 (CET)
Date: Thu, 28 Jan 2021 12:04:11 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Lianbo Jiang <lijiang@redhat.com>
Subject: Re: [PATCH 0/2 v2] iommu: fix the failure of deferred attach for
 iommu attach device
Message-ID: <20210128110411.GJ32671@8bytes.org>
References: <20210119111616.12761-1-lijiang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210119111616.12761-1-lijiang@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: thomas.lendacky@amd.com, will@kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com
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

On Tue, Jan 19, 2021 at 07:16:14PM +0800, Lianbo Jiang wrote:
> Lianbo Jiang (2):
>   dma-iommu: use static-key to minimize the impact in the fast-path
>   iommu: use the __iommu_attach_device() directly for deferred attach
> 
>  drivers/iommu/dma-iommu.c | 29 +++++++++++------------------
>  drivers/iommu/iommu.c     | 12 ++++++++++++
>  include/linux/iommu.h     |  2 ++
>  3 files changed, 25 insertions(+), 18 deletions(-)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
