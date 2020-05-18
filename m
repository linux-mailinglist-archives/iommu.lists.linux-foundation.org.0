Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0191D8B59
	for <lists.iommu@lfdr.de>; Tue, 19 May 2020 01:04:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B7A0221526;
	Mon, 18 May 2020 23:04:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7rsuDTTfWZtx; Mon, 18 May 2020 23:04:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EF846220D6;
	Mon, 18 May 2020 23:04:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9375C07FF;
	Mon, 18 May 2020 23:04:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7ECF8C07FF
 for <iommu@lists.linux-foundation.org>; Mon, 18 May 2020 23:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6F0D58671C
 for <iommu@lists.linux-foundation.org>; Mon, 18 May 2020 23:04:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ob4zp-QmdYf for <iommu@lists.linux-foundation.org>;
 Mon, 18 May 2020 23:04:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5C1A886500
 for <iommu@lists.linux-foundation.org>; Mon, 18 May 2020 23:04:28 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D56B7207F9;
 Mon, 18 May 2020 23:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589843068;
 bh=KGUQGz4db3YjWPudFeOfKSYM0sWPkRsvPRm4npW190o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QiYgQErP+LqAuYyClBRqQfZb8lTctaFLjv1rRjDatVQa4+ACebdT3cczztU9y/m4X
 E6a5RwRyF7McE6jg2mwRHz+DInqvnyTv0xcLfVldVojV0mFkp/NvQmKk06TlQy2MHS
 K6mn7Pw3TmAhV73dowk5GXTeTO8eObZgPHiY4Zv0=
From: Will Deacon <will@kernel.org>
To: robin.murphy@arm.com, swboyd@chromium.org, joro@8bytes.org,
 Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v6] iommu/arm-smmu-qcom: Request direct mapping for modem
 device
Date: Tue, 19 May 2020 00:04:08 +0100
Message-Id: <158981250642.239015.17275693427372248725.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200511175532.25874-1-sibis@codeaurora.org>
References: <20200511175532.25874-1-sibis@codeaurora.org>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 dianders@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
 iommu@lists.linux-foundation.org, mka@chromium.org,
 linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
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

On Mon, 11 May 2020 23:25:32 +0530, Sibi Sankar wrote:
> The modem remote processor has two access paths to DDR. One path is
> directly connected to DDR and another path goes through an SMMU. The
> SMMU path is configured to be a direct mapping because it's used by
> various peripherals in the modem subsystem. Typically this direct
> mapping is configured statically at EL2 by QHEE (Qualcomm's Hypervisor
> Execution Environment) before the kernel is entered.
> 
> [...]

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu-qcom: Request direct mapping for modem device
      https://git.kernel.org/will/c/d100ff3843b7

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
