Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F4E420A99
	for <lists.iommu@lfdr.de>; Mon,  4 Oct 2021 14:05:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 453DF60AEB;
	Mon,  4 Oct 2021 12:05:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sVgHi3D4UkK0; Mon,  4 Oct 2021 12:05:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6FF2160AE6;
	Mon,  4 Oct 2021 12:05:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C5D1C0022;
	Mon,  4 Oct 2021 12:05:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76E51C000D
 for <iommu@lists.linux-foundation.org>; Mon,  4 Oct 2021 12:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 651CB40486
 for <iommu@lists.linux-foundation.org>; Mon,  4 Oct 2021 12:05:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UkCvE2LXMHDE for <iommu@lists.linux-foundation.org>;
 Mon,  4 Oct 2021 12:05:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A54B404A3
 for <iommu@lists.linux-foundation.org>; Mon,  4 Oct 2021 12:05:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7556061215;
 Mon,  4 Oct 2021 12:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633349149;
 bh=97kgmJBa0qL8A5UxMz3vj6lMPTHTmg9/W7lY7JruH7o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y41TowH1y/OerqL/AS1oT8JSyc7icR5rmPPeJdoW/ig3m/RuxwbbqhgTIETFKb8q8
 xgKniB7v2ZJuP0cGEeS+J/U5nDjRGxNxMd1SVlUAIHp3ZsZxkU8b04q8H1+TYZHwoJ
 TZntYoAQI+rXokEK/EnZwXUSgCdPq6WQeUf+0XqbA1lw685O1t6cj+Cut4sUb2c5AB
 iHZuv7Aibl3H7ZEX4JvisO7eKGtCAS0dJvE+kgxv5tnHS5GOaHrigP8CViLu3HILdv
 WSDvgBL2UyHw0DqeE0g/Oo3oC2zCd8bP6fm4Ulmd0AoPj8w4wBOAIT0cmnWVVA3rfK
 Dc6emV/Fmeteg==
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 iommu <iommu@lists.linux-foundation.org>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Stop pre-zeroing batch commands in
 arm_smmu_atc_inv_master()
Date: Mon,  4 Oct 2021 13:05:35 +0100
Message-Id: <163334645081.1581475.7922976720083700299.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210817113411.1962-1-thunder.leizhen@huawei.com>
References: <20210817113411.1962-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Cc: catalin.marinas@arm.com, kernel-team@android.com,
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

On Tue, 17 Aug 2021 19:34:11 +0800, Zhen Lei wrote:
> Pre-zeroing the batched commands structure is inefficient, as individual
> commands are zeroed later in arm_smmu_cmdq_build_cmd(). Therefore, only
> the member 'num' needs to be initialized to 0.
> 
> 

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu-v3: Stop pre-zeroing batch commands in arm_smmu_atc_inv_master()
      https://git.kernel.org/will/c/93f9f7958f12

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
