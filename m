Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 102B439F559
	for <lists.iommu@lfdr.de>; Tue,  8 Jun 2021 13:43:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 935DA40424;
	Tue,  8 Jun 2021 11:42:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Br_oDsNeyghX; Tue,  8 Jun 2021 11:42:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FFA14044B;
	Tue,  8 Jun 2021 11:42:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4AAF4C0001;
	Tue,  8 Jun 2021 11:42:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACD55C0001
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 11:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8EF4A83B14
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 11:42:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KN1WwrYClybA for <iommu@lists.linux-foundation.org>;
 Tue,  8 Jun 2021 11:42:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEC7D83AA2
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 11:42:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31B7061354;
 Tue,  8 Jun 2021 11:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623152569;
 bh=k9u4oLtqZFZqMQL5RbX/43JiWGWq0vXU6dFMnuHjNoo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h39WeBtDyBSnnyS/KwdvKIPeiku1C6zXw7LmVal2HB5v0KgjR7LYJPAto245v4w83
 W9mGsRstf8WFhBnWoV6kJ1quWeQX23mNBjCvqMG1Iofg5z8LVtIWPGTm688mbFQP+N
 uRoFyYS5dNBUzRhvhL380PCYnHLnwMMLFENGABvXecoxBPGP2UtukuNStVcek0oFvO
 DV9L5fgy93xFwlVCMAg/9KK/Y9XhNC1ydbAqA72XU3Tr+TCuX6LaDZbXF0pT/dCnJy
 JdTgS6+0RyWe4iTM+Ny6NzHac3JQo3qP54Ur3WTWo8O0MKuytlKVim4DWt4aB7cfKf
 oh4CYOEKQogMg==
From: Will Deacon <will@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
	joro@8bytes.org
Subject: Re: [PATCH v15 0/3] iommu/arm-smmu-v3: Add stall support
Date: Tue,  8 Jun 2021 12:42:34 +0100
Message-Id: <162314710744.3707892.6632600736379822229.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210526161927.24268-1-jean-philippe@linaro.org>
References: <20210526161927.24268-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
 catalin.marinas@arm.com, guohanjun@huawei.com, rjw@rjwysocki.net,
 robin.murphy@arm.com, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org, sudeep.holla@arm.com,
 zhangfei.gao@linaro.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, lenb@kernel.org
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

On Wed, 26 May 2021 18:19:25 +0200, Jean-Philippe Brucker wrote:
> Add stall support for SMMUv3, enabling I/O page faults and SVA for
> compatible devices. No change since last version [1], but I'd still like
> this to be considered for upstream, because there exists hardware and
> applications.
> 
> Stall is implemented by the Kunpeng 920 processor for its compression
> and crypto accelerators, with which I tested the SVA infrastructure.
> Using the userspace accelerator API [2], a program can obtain a queue
> from one of these devices and submit compression or encryption work
> within the program's address space. UADK [3] provides a library to do
> this, and there is an openssl plugin [4] to use it.
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/3] dt-bindings: document stall property for IOMMU masters
      https://git.kernel.org/will/c/ed1d08b9d0c9
[2/3] ACPI/IORT: Enable stall support for platform devices
      https://git.kernel.org/will/c/6522b1e0c78f
[3/3] iommu/arm-smmu-v3: Add stall support for platform devices
      https://git.kernel.org/will/c/395ad89d11fd

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
