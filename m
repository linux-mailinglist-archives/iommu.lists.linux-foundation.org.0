Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C6339BC18
	for <lists.iommu@lfdr.de>; Fri,  4 Jun 2021 17:38:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF4C040229;
	Fri,  4 Jun 2021 15:38:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QlD2Jwtihf7S; Fri,  4 Jun 2021 15:38:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44BA94020D;
	Fri,  4 Jun 2021 15:38:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23B96C0001;
	Fri,  4 Jun 2021 15:38:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C12D0C0001
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 15:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCB0C60834
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 15:38:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RBh9R0oLgL_p for <iommu@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 15:38:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CD1A60689
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 15:38:26 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 1CCB73A9; Fri,  4 Jun 2021 17:38:24 +0200 (CEST)
Date: Fri, 4 Jun 2021 17:38:22 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Nadav Amit <nadav.amit@gmail.com>
Subject: Re: [PATCH v2 0/4] iommu/amd: Enable page-selective flushes
Message-ID: <YLpI7tKtsf4l5MlN@8bytes.org>
References: <20210524224159.32807-1-namit@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210524224159.32807-1-namit@vmware.com>
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

Hi Nadav,

[Adding Robin]

On Mon, May 24, 2021 at 03:41:55PM -0700, Nadav Amit wrote:
> Nadav Amit (4):
>   iommu/amd: Fix wrong parentheses on page-specific invalidations

This patch is already upstream in v5.13-rc4. Please rebase to that
version.

>   iommu/amd: Selective flush on unmap
>   iommu/amd: Do not sync on page size changes
>   iommu/amd: Do not use flush-queue when NpCache is on

And I think there have been objections from Robin Murphy on Patch 3,
have those been worked out?

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
