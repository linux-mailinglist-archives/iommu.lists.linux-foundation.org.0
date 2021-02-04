Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 749EB30F40B
	for <lists.iommu@lfdr.de>; Thu,  4 Feb 2021 14:42:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0CDE0868F1;
	Thu,  4 Feb 2021 13:42:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UrlLLB2ABUi4; Thu,  4 Feb 2021 13:42:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 85C4E86225;
	Thu,  4 Feb 2021 13:42:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E409C1834;
	Thu,  4 Feb 2021 13:42:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E4FDC013A
 for <iommu@lists.linux-foundation.org>; Thu,  4 Feb 2021 13:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 870FC203C4
 for <iommu@lists.linux-foundation.org>; Thu,  4 Feb 2021 13:42:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9BxsVl-6fexg for <iommu@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 13:42:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id C186320353
 for <iommu@lists.linux-foundation.org>; Thu,  4 Feb 2021 13:42:31 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 64499387; Thu,  4 Feb 2021 14:42:30 +0100 (CET)
Date: Thu, 4 Feb 2021 14:42:28 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 0/7] [PULL REQUEST] iommu/vt-d: Update for v5.12
Message-ID: <20210204134228.GC27686@8bytes.org>
References: <20210204014401.2846425-1-baolu.lu@linux.intel.com>
 <2a10e88d-b7fe-21b5-c558-8bd312ee8d69@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a10e88d-b7fe-21b5-c558-8bd312ee8d69@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Kyung Min Park <kyung.min.park@intel.com>, iommu@lists.linux-foundation.org,
 Chuck Lever <chuck.lever@oracle.com>, Bjorn Helgaas <bhelgaas@google.com>,
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

On Thu, Feb 04, 2021 at 07:52:29PM +0800, Lu Baolu wrote:
> Hi Joerg,
> 
> I just received some internal comments on the last patch
> 
> [PATCH 7/7] iommu/vt-d: Apply SATC policy
> 
> We need some extra work on it and probably re-target it to v5.13.
> 
> Can you please only consider patch 1 ~ 6 for v5.12?

Applied patches 1-6, thanks Baolu.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
