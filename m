Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCF22F3962
	for <lists.iommu@lfdr.de>; Tue, 12 Jan 2021 20:03:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B144685570;
	Tue, 12 Jan 2021 19:03:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pfj_RymCKncw; Tue, 12 Jan 2021 19:03:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 64D13854E5;
	Tue, 12 Jan 2021 19:03:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5EDC9C0893;
	Tue, 12 Jan 2021 19:03:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB5A0C013A
 for <iommu@lists.linux-foundation.org>; Tue, 12 Jan 2021 19:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C40E11FE49
 for <iommu@lists.linux-foundation.org>; Tue, 12 Jan 2021 19:03:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P7zEeA0NPL4y for <iommu@lists.linux-foundation.org>;
 Tue, 12 Jan 2021 19:03:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id E95B62039E
 for <iommu@lists.linux-foundation.org>; Tue, 12 Jan 2021 19:03:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1144A23122;
 Tue, 12 Jan 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610478210;
 bh=sq7HXLleUd62z0dDAFs3dJtqQSEIyugOuRy1f/SCVdE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A83JR4Llrtx0Yw1P9Nl5vk+uf1CJcZGR/8ndT0C2WzvNu8BZTfrSknpPx9vt5Ilx7
 BX/pp/gYCHpm8d1QPL7uyqNbvautoyipOVf3aXeGfNTG86SQNgVkvxeBqBvHhhAau5
 Um8Pjn20UMnIyDwcUdKA385ZCmQPyFuNwIjBeG6uNpGyngRopF6GGtj/N6TIWhLP7I
 Y5J6YpWiK7UstuP2JDGaJ9s85ZhMVvP/vE3e0O4suRWvkhaMW8xKoevAGy+8wjvri7
 waar3tvW6hni5DAJEXyQw9PMiW5FJRiGKJHBhfQhS85RZK1ZyfShkXrXNCP2J98E7+
 bl/SZVdWIQY5g==
From: Will Deacon <will@kernel.org>
To: dwmw2@infradead.org, joro@8bytes.org, baolu.lu@linux.intel.com,
 Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] iommu/vt-d: Fix duplicate included linux/dma-map-ops.h
Date: Tue, 12 Jan 2021 19:03:21 +0000
Message-Id: <161047058104.1115665.8750505554416870263.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1609118774-10083-1-git-send-email-tiantao6@hisilicon.com>
References: <1609118774-10083-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Cc: catalin.marinas@arm.com, iommu@lists.linux-foundation.org,
 kernel-team@android.com, Will Deacon <will@kernel.org>
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

On Mon, 28 Dec 2020 09:26:14 +0800, Tian Tao wrote:
> linux/dma-map-ops.h is included more than once, Remove the one that
> isn't necessary.

Applied to arm64 (for-next/iommu/fixes), thanks!

[1/1] iommu/vt-d: Fix duplicate included linux/dma-map-ops.h
      https://git.kernel.org/arm64/c/694a1c0adebe

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
