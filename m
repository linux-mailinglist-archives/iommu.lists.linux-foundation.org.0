Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AF7300484
	for <lists.iommu@lfdr.de>; Fri, 22 Jan 2021 14:49:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1C8B7870D7;
	Fri, 22 Jan 2021 13:49:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G0bRpeMjHWh3; Fri, 22 Jan 2021 13:49:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 28DC5870D9;
	Fri, 22 Jan 2021 13:49:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00DFFC013A;
	Fri, 22 Jan 2021 13:49:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2055C013A
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 13:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8DDD48738F
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 13:49:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MWRDqKaOhtVk for <iommu@lists.linux-foundation.org>;
 Fri, 22 Jan 2021 13:49:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D2FCA8738E
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 13:49:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D87C23A5B;
 Fri, 22 Jan 2021 13:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611323382;
 bh=AY9loDHgMeh2ZrnMx2lrCACh+G+05K6Me4W/feLoMc8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QxTh39XsfhIr+7UCem5TAVRicZQiAoBGoWhLf8XwcaLIw7KvoxgA2OUVpA6i2jy7G
 unR/N35/jqJVpsUTrLoZMbJK4/VYRnVTqNaWjxsnub+FxH6lJ72LqRD8+k7lImApsm
 lyIGAOuLKC12xN1WBq7Jrepa4aCfC/TrryoYj2Q5NX8qBARwEg12S8ioVJA2GhgRnf
 AH1YKFUqhfxVPMB/fbuq7TWfyXxIqrBcWFVsfxZKGraCamlUSKse/PhhLs6MeN/6ME
 wWrxyGmdAkbo2/Tk+fN+QFoE7sHzdFvJNBLdX4PqY48RluEDF8R5XRdm91+2uYVyMz
 5XTU3RbVaMQrA==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Remove the page 1 fixup
Date: Fri, 22 Jan 2021 13:49:32 +0000
Message-Id: <161132157305.230952.1264812810810433047.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <08d9bda570bb5681f11a2f250a31be9ef763b8c5.1611238182.git.robin.murphy@arm.com>
References: <08d9bda570bb5681f11a2f250a31be9ef763b8c5.1611238182.git.robin.murphy@arm.com>
MIME-Version: 1.0
Cc: jean-philippe@linaro.org, Will Deacon <will@kernel.org>,
 catalin.marinas@arm.com, iommu@lists.linux-foundation.org,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org
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

On Thu, 21 Jan 2021 14:09:42 +0000, Robin Murphy wrote:
> Since we now keep track of page 1 via a separate pointer that already
> encapsulates aliasing to page 0 as necessary, we can remove the clunky
> fixup routine and simply use the relevant bases directly. The current
> architecture spec (IHI0070D.a) defines SMMU_{EVENTQ,PRIQ}_{PROD,CONS} as
> offsets relative to page 1, so the cleanup represents a little bit of
> convergence as well as just lines of code saved.

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu-v3: Remove the page 1 fixup
      https://git.kernel.org/will/c/86d2d9214880

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
