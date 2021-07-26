Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3079B3D598A
	for <lists.iommu@lfdr.de>; Mon, 26 Jul 2021 14:31:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7FBE4022F;
	Mon, 26 Jul 2021 12:31:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lJcpZtjDhorq; Mon, 26 Jul 2021 12:31:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 13D5A401F1;
	Mon, 26 Jul 2021 12:31:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF463C000E;
	Mon, 26 Jul 2021 12:31:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28251C000E
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 12:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08C7883529
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 12:31:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fsWIIXV0QTyu for <iommu@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 12:31:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7CF138350A
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 12:31:15 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 66EEB2B0; Mon, 26 Jul 2021 14:31:13 +0200 (CEST)
Date: Mon, 26 Jul 2021 14:31:12 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Nadav Amit <nadav.amit@gmail.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH v6 0/7] iommu/amd: Enable page-selective flushes
Message-ID: <YP6rEOy5ti0SHuns@8bytes.org>
References: <20210723093209.714328-1-namit@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210723093209.714328-1-namit@vmware.com>
Cc: Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Nadav Amit <namit@vmware.com>,
 Jiajun Cao <caojiajun@vmware.com>, Will Deacon <will@kernel.org>
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

[ Adding Suravee, reviewer for AMD IOMMU ]

On Fri, Jul 23, 2021 at 02:32:02AM -0700, Nadav Amit wrote:
> Nadav Amit (6):
>   iommu/amd: Selective flush on unmap
>   iommu/amd: Do not use flush-queue when NpCache is on
>   iommu: Factor iommu_iotlb_gather_is_disjoint() out
>   iommu/amd: Tailored gather logic for AMD
>   iommu/amd: Sync once for scatter-gather operations
>   iommu/amd: Use only natural aligned flushes in a VM
> 
> Robin Murphy (1):
>   iommu: Improve iommu_iotlb_gather helpers

Thanks for your work on this, Nadav. If there are no further objections
I am going to apply the patches later this week.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
