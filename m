Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE682D0E9B
	for <lists.iommu@lfdr.de>; Mon,  7 Dec 2020 12:05:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0710A86C71;
	Mon,  7 Dec 2020 11:05:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NxhyvhEn-xKI; Mon,  7 Dec 2020 11:05:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7D5BE86C67;
	Mon,  7 Dec 2020 11:05:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6265EC013B;
	Mon,  7 Dec 2020 11:05:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C21DC013B
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 11:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 858212002B
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 11:05:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HT5c2rtexbUW for <iommu@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 11:05:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id A49701FC7D
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 11:05:30 +0000 (UTC)
From: Will Deacon <will@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: iommu@lists.linux-foundation.org,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/amd: Set DTE[IntTabLen] to represent 512 IRTEs
Date: Mon,  7 Dec 2020 11:05:23 +0000
Message-Id: <160733882472.3526398.13030595786733592233.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201207091920.3052-1-suravee.suthikulpanit@amd.com>
References: <20201207091920.3052-1-suravee.suthikulpanit@amd.com>
MIME-Version: 1.0
Cc: catalin.marinas@arm.com, Jon.Grimm@amd.com, kernel-team@android.com,
 brijesh.singh@amd.com, Will Deacon <will@kernel.org>
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

On Mon, 7 Dec 2020 03:19:20 -0600, Suravee Suthikulpanit wrote:
> According to the AMD IOMMU spec, the commit 73db2fc595f3
> ("iommu/amd: Increase interrupt remapping table limit to 512 entries")
> also requires the interrupt table length (IntTabLen) to be set to 9
> (power of 2) in the device table mapping entry (DTE).

Applied to arm64 (for-next/iommu/fixes), thanks!

[1/1] iommu/amd: Set DTE[IntTabLen] to represent 512 IRTEs
      https://git.kernel.org/arm64/c/4165bf015ba9

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
