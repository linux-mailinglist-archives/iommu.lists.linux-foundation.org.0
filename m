Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F9E3075BD
	for <lists.iommu@lfdr.de>; Thu, 28 Jan 2021 13:17:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4305087271;
	Thu, 28 Jan 2021 12:17:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FW4xRaSydqnj; Thu, 28 Jan 2021 12:17:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2559887290;
	Thu, 28 Jan 2021 12:17:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06569C013A;
	Thu, 28 Jan 2021 12:17:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 054B3C013A
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 12:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DFD0B86B12
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 12:17:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6uLIS369sVau for <iommu@lists.linux-foundation.org>;
 Thu, 28 Jan 2021 12:17:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9D50F86AEB
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 12:17:52 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 9A61D51D; Thu, 28 Jan 2021 13:17:49 +0100 (CET)
Date: Thu, 28 Jan 2021 13:17:48 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 1/1] iommu/vt-d: Correctly check addr alignment in
 qi_flush_dev_iotlb_pasid()
Message-ID: <20210128121747.GK32671@8bytes.org>
References: <20210119043500.1539596-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210119043500.1539596-1-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ashok Raj <ashok.raj@intel.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Guo Kaijie <Kaijie.Guo@intel.com>,
 Will Deacon <will@kernel.org>
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

On Tue, Jan 19, 2021 at 12:35:00PM +0800, Lu Baolu wrote:
> An incorrect address mask is being used in the qi_flush_dev_iotlb_pasid()
> to check the address alignment. This leads to a lot of spurious kernel
> warnings:
> 
> [  485.837093] DMAR: Invalidate non-aligned address 7f76f47f9000, order 0
> [  485.837098] DMAR: Invalidate non-aligned address 7f76f47f9000, order 0
> [  492.494145] qi_flush_dev_iotlb_pasid: 5734 callbacks suppressed
> [  492.494147] DMAR: Invalidate non-aligned address 7f7728800000, order 11
> [  492.508965] DMAR: Invalidate non-aligned address 7f7728800000, order 11
> 
> Fix it by checking the alignment in right way.
> 
> Fixes: 288d08e780088 ("iommu/vt-d: Handle non-page aligned address")
> Reported-and-tested-by: Guo Kaijie <Kaijie.Guo@intel.com>
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> Cc: Liu Yi L <yi.l.liu@intel.com>
> ---
>  drivers/iommu/intel/dmar.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied for 5.11, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
