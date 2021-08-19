Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC373F1581
	for <lists.iommu@lfdr.de>; Thu, 19 Aug 2021 10:47:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4254560BCB;
	Thu, 19 Aug 2021 08:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4VfQWdRa22Yi; Thu, 19 Aug 2021 08:47:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1AC7860BD3;
	Thu, 19 Aug 2021 08:47:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC2A1C0022;
	Thu, 19 Aug 2021 08:46:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE870C000E
 for <iommu@lists.linux-foundation.org>; Thu, 19 Aug 2021 08:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 941F060BCB
 for <iommu@lists.linux-foundation.org>; Thu, 19 Aug 2021 08:46:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aYttvRteqJJ0 for <iommu@lists.linux-foundation.org>;
 Thu, 19 Aug 2021 08:46:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B38BA60BC5
 for <iommu@lists.linux-foundation.org>; Thu, 19 Aug 2021 08:46:55 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 725E02AA; Thu, 19 Aug 2021 10:46:52 +0200 (CEST)
Date: Thu, 19 Aug 2021 10:46:45 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 0/9] [PULL REQUEST] Intel IOMMU Updates for Linux v5.15
Message-ID: <YR4adYdKMv1gLPI3@8bytes.org>
References: <20210818134852.1847070-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210818134852.1847070-1-baolu.lu@linux.intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Sanjay Kumar <sanjay.k.kumar@intel.com>, iommu@lists.linux-foundation.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

On Wed, Aug 18, 2021 at 09:48:43PM +0800, Lu Baolu wrote:
> Andy Shevchenko (1):
>   iommu/vt-d: Drop the kernel doc annotation
> 
> Liu Yi L (2):
>   iommu/vt-d: Use pasid_pte_is_present() helper function
>   iommu/vt-d: Add present bit check in pasid entry setup helpers
> 
> Lu Baolu (5):
>   iommu/vt-d: Update the virtual command related registers
>   iommu/vt-d: Refactor Kconfig a bit
>   iommu/vt-d: Enable Intel IOMMU scalable mode by default
>   iommu/vt-d: Preset A/D bits for user space DMA usage
>   iommu/vt-d: Allow devices to have more than 32 outstanding PRs
> 
> Zhen Lei (1):
>   iommu/vt-d: Remove unnecessary oom message

Applied, thanks Baolu.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
