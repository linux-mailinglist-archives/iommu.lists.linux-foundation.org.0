Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F9656CD70
	for <lists.iommu@lfdr.de>; Sun, 10 Jul 2022 08:37:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12AEA40931;
	Sun, 10 Jul 2022 06:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12AEA40931
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LdhAUE1e
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mZbLQHpkJC8P; Sun, 10 Jul 2022 06:37:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E498940278;
	Sun, 10 Jul 2022 06:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E498940278
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D9D5C00B4;
	Sun, 10 Jul 2022 06:37:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 855DBC002D
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 13:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50806415DA
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 13:56:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50806415DA
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=LdhAUE1e
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TBvqMJeMxL1c for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jul 2022 13:56:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A48BD400EC
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A48BD400EC
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 13:56:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7BE6062818;
 Fri,  8 Jul 2022 13:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79104C341C0;
 Fri,  8 Jul 2022 13:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657288559;
 bh=vUnJeGk6PURBMTNQYZb3D8KGF3E0//wVCAiUeEdZQuA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LdhAUE1eiT10VVl+XThRV7BK1mqecq4Uht/fc+RdwjeWRRMg6KxJbVNAl11h7mzxC
 zsnC4OOlVXla3W/VTgWAvvHs6hp67eeRt8osWH8T0AjfhWUYsBu/iK8Doea25/XFTh
 Hj43AV8K1ZvZJN3ad/3mLLLWK552cOerDhyPMzRpmM9XOT/UKzUzMV38sIlQ7wT7Sf
 PECcKLvd1tkxzM4kQF/z3LcKkFXbDTo1FjT27g24OB3m2oon0MltBGSAq3rkL2Fp5P
 /U1G7yQoknPGTY2/+YeKe34fvKOaTaV99hBrykCjBWMVPsXSUpNi0yZtoSYO88VRSc
 sgRQYD4EaWk8A==
From: Will Deacon <will@kernel.org>
To: Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCHv3] iommu/arm-smmu-qcom: Add debug support for TLB sync
 timeouts
Date: Fri,  8 Jul 2022 14:55:53 +0100
Message-Id: <165728615303.683968.1528285807329632811.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220708094230.4349-1-quic_saipraka@quicinc.com>
References: <20220708094230.4349-1-quic_saipraka@quicinc.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 10 Jul 2022 06:37:28 +0000
Cc: Will Deacon <will@kernel.org>, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org, kernel-team@android.com,
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

On Fri, 8 Jul 2022 15:12:30 +0530, Sai Prakash Ranjan wrote:
> TLB sync timeouts can be due to various reasons such as TBU power down
> or pending TCU/TBU invalidation/sync and so on. Debugging these often
> require dumping of some implementation defined registers to know the
> status of TBU/TCU operations and some of these registers are not
> accessible in non-secure world such as from kernel and requires SMC
> calls to read them in the secure world. So, add this debug support
> to dump implementation defined registers for TLB sync timeout issues.
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu-qcom: Add debug support for TLB sync timeouts
      https://git.kernel.org/will/c/b9b721d117e9

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
