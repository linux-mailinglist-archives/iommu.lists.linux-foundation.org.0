Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B521A308034
	for <lists.iommu@lfdr.de>; Thu, 28 Jan 2021 22:07:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4D1CC872F1;
	Thu, 28 Jan 2021 21:07:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QwnCI-pgmckU; Thu, 28 Jan 2021 21:07:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CCD19872CE;
	Thu, 28 Jan 2021 21:07:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9A3EC013A;
	Thu, 28 Jan 2021 21:07:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74371C013A
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 21:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6204786D86
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 21:07:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dYhp6IUB8syd for <iommu@lists.linux-foundation.org>;
 Thu, 28 Jan 2021 21:07:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DA03786D4E
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 21:07:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 764F264DE0;
 Thu, 28 Jan 2021 21:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611868051;
 bh=EA9BDZCY3xfLPZ5DrPbxdvDp0B8+AD1wKoUQ2tj2HgM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EbUwE2Gv3WqHJjijQHrCIdctsUeD/cJ4CquNn84mwNd7vFg/eXvaq3OhIVsOWD6T/
 dSFCapbzKCDNC/qgXuAZcgopCFDMAFvH/Z/oCC8m/Xx6V+Z6ElD1LHVSTN9n8MPbSe
 VUKwqldjN3M4wbQaHQyvVfhkP/m1pzhqdP0ARnTu4Y4CIi+B9yPxednixOJ39gaQ61
 9vPYgrKkKHYR8In9pBsiMx6pDt39sTVjkzz9ye2bpgnBIdVWydmBFlZwqCrZqUVIj6
 GeyjkK8jrbeWdSn4WyDK2qHZjYbGKszQaw111CUMZNm9Lq4MdgywYmqs78/qpJbzbG
 AakAK7nfngRGg==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/2] iommu/msm: Hook up iotlb_sync_map
Date: Thu, 28 Jan 2021 21:07:21 +0000
Message-Id: <161186579710.2024269.3735234829301775634.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <e95223a0abf129230a0bec6743f837075f0a2fcb.1611764372.git.robin.murphy@arm.com>
References: <e95223a0abf129230a0bec6743f837075f0a2fcb.1611764372.git.robin.murphy@arm.com>
MIME-Version: 1.0
Cc: architt@codeaurora.org, Will Deacon <will@kernel.org>,
 catalin.marinas@arm.com, iommu@lists.linux-foundation.org,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
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

On Wed, 27 Jan 2021 16:29:28 +0000, Robin Murphy wrote:
> The core API can now accommodate invalidate-on-map style behaviour in a
> single efficient call, so hook that up instead of having io-pgatble do
> it piecemeal.

Applied to arm64 (for-joerg/mtk), thanks!

[1/2] iommu/msm: Hook up iotlb_sync_map
      https://git.kernel.org/arm64/c/c867c78acae9
[2/2] iommu/io-pgtable: Remove TLBI_ON_MAP quirk
      https://git.kernel.org/arm64/c/3d5eab41451f

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
