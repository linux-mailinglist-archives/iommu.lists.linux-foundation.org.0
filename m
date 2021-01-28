Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D21D3073CD
	for <lists.iommu@lfdr.de>; Thu, 28 Jan 2021 11:32:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 17F6E864F4;
	Thu, 28 Jan 2021 10:32:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xmk0VQS2FcqN; Thu, 28 Jan 2021 10:32:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B5F45864EF;
	Thu, 28 Jan 2021 10:32:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84B63C1825;
	Thu, 28 Jan 2021 10:32:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E95BC08A1
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 10:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 48C208734C
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 10:32:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eDbetcQM2YO0 for <iommu@lists.linux-foundation.org>;
 Thu, 28 Jan 2021 10:32:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C96958737E
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 10:32:51 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 637ED51D; Thu, 28 Jan 2021 11:32:50 +0100 (CET)
Date: Thu, 28 Jan 2021 11:32:48 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 1/1] iommu/vt-d: Add qi_submit trace event
Message-ID: <20210128103248.GH32671@8bytes.org>
References: <20210114090400.736104-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210114090400.736104-1-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org
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

On Thu, Jan 14, 2021 at 05:04:00PM +0800, Lu Baolu wrote:
> This adds a new trace event to track the submissions of requests to the
> invalidation queue. This event will provide the information like:
> - IOMMU name
> - Invalidation type
> - Descriptor raw data
> 
> A sample output like:
> | qi_submit: iotlb_inv dmar1: 0x100e2 0x0 0x0 0x0
> | qi_submit: dev_tlb_inv dmar1: 0x1000000003 0x7ffffffffffff001 0x0 0x0
> | qi_submit: iotlb_inv dmar2: 0x800f2 0xf9a00005 0x0 0x0
> 
> This will be helpful for queued invalidation related debugging.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/iommu/intel/dmar.c         |  3 +++
>  include/trace/events/intel_iommu.h | 37 ++++++++++++++++++++++++++++++
>  2 files changed, 40 insertions(+)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
