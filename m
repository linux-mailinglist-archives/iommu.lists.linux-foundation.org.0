Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 892B3340314
	for <lists.iommu@lfdr.de>; Thu, 18 Mar 2021 11:24:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CDA084190;
	Thu, 18 Mar 2021 10:24:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rNHGctmn8np5; Thu, 18 Mar 2021 10:24:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35D328405D;
	Thu, 18 Mar 2021 10:24:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EDF12C0001;
	Thu, 18 Mar 2021 10:24:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE2A5C0001
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 10:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B160C4EC25
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 10:24:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8u0iVFkgl4pa for <iommu@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 10:24:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03F8B4ECB4
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 10:24:22 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id C33B72D8; Thu, 18 Mar 2021 11:24:20 +0100 (CET)
Date: Thu, 18 Mar 2021 11:24:19 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Kyung Min Park <kyung.min.park@intel.com>
Subject: Re: [PATCH] iommu/vt-d: Disable SVM when ATS/PRI/PASID are not
 enabled in the device
Message-ID: <YFMqU2Rp+9CYVX6s@8bytes.org>
References: <20210314201534.918-1-kyung.min.park@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210314201534.918-1-kyung.min.park@intel.com>
Cc: ravi.v.shankar@intel.com, ashok.raj@intel.com, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 will@kernel.org
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

On Sun, Mar 14, 2021 at 01:15:34PM -0700, Kyung Min Park wrote:
> Currently, the Intel VT-d supports Shared Virtual Memory (SVM) only when
> IO page fault is supported. Otherwise, shared memory pages can not be
> swapped out and need to be pinned. The device needs the Address Translation
> Service (ATS), Page Request Interface (PRI) and Process Address Space
> Identifier (PASID) capabilities to be enabled to support IO page fault.
> 
> Disable SVM when ATS, PRI and PASID are not enabled in the device.
> 
> Signed-off-by: Kyung Min Park <kyung.min.park@intel.com>

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
