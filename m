Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 853A039F557
	for <lists.iommu@lfdr.de>; Tue,  8 Jun 2021 13:42:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAC1B4044C;
	Tue,  8 Jun 2021 11:42:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7w-tVyYYJfvU; Tue,  8 Jun 2021 11:42:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46DD840448;
	Tue,  8 Jun 2021 11:42:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 162DFC0011;
	Tue,  8 Jun 2021 11:42:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D77C3C0001
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 11:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB06040426
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 11:42:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PaWcZ-8gyxhx for <iommu@lists.linux-foundation.org>;
 Tue,  8 Jun 2021 11:42:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E444540424
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 11:42:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 275DB6135A;
 Tue,  8 Jun 2021 11:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623152565;
 bh=7yzh+PEb1Lrr14QAVcHWymgeCbD/syftVVf1BSU4qQ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Jha0e3Ymx81k48LOLCW4bfbKqzjxo5BI2qevvD6fegrebjgftgonCpw58b+V2POtJ
 LLT6rS2CKEJSR6tvEyRvw9JTk/zu5yJoVj3AGXHTOEdQoKqTcWwYxNNKxCfsraaXKl
 ndA6exA2i2ZTSJQDiJX94b1+kCUCr5mWx0/0CXL9IBAejlvprHrnB1V5zWekiCRJYS
 8SfJkT8KkX67hysOqtr2ZqaNQNg0LzwErw94wV14u2WNdeMzSMCzqU+xhEn2nrAUCj
 4eQfMvnhbIkKbtMX3LIQdQVYJd089vXYEDveB7lQFVWWTbXccX1y6D3UU7xeDY1d0f
 nt2TVvGVvMJxQ==
From: Will Deacon <will@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
	joro@8bytes.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Ratelimit event dump
Date: Tue,  8 Jun 2021 12:42:33 +0100
Message-Id: <162314721342.3708312.1594980540576735663.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210531095648.118282-1-jean-philippe@linaro.org>
References: <20210531095648.118282-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: Will Deacon <will@kernel.org>, catalin.marinas@arm.com,
 robin.murphy@arm.com, Aaro Koskinen <aaro.koskinen@nokia.com>,
 iommu@lists.linux-foundation.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
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

On Mon, 31 May 2021 11:56:50 +0200, Jean-Philippe Brucker wrote:
> When a device or driver misbehaves, it is possible to receive DMA fault
> events much faster than we can print them out, causing a lock up of the
> system and inability to cancel the source of the problem. Ratelimit
> printing of events to help recovery.

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu-v3: Ratelimit event dump
      https://git.kernel.org/will/c/9cff922bba42

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
