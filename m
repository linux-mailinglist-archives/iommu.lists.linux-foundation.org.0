Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3223D2B7F42
	for <lists.iommu@lfdr.de>; Wed, 18 Nov 2020 15:19:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C4C6084475;
	Wed, 18 Nov 2020 14:19:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xfWojgK3wAmt; Wed, 18 Nov 2020 14:19:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6267F84741;
	Wed, 18 Nov 2020 14:19:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 517D7C07FF;
	Wed, 18 Nov 2020 14:19:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94F6AC07FF
 for <iommu@lists.linux-foundation.org>; Wed, 18 Nov 2020 14:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3F58B203DC
 for <iommu@lists.linux-foundation.org>; Wed, 18 Nov 2020 14:19:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kWOVcUkOEOoH for <iommu@lists.linux-foundation.org>;
 Wed, 18 Nov 2020 14:19:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 96F8320356
 for <iommu@lists.linux-foundation.org>; Wed, 18 Nov 2020 14:19:27 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
 [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E91C12224C;
 Wed, 18 Nov 2020 14:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605709166;
 bh=XaegP8rxhA8VE/0u0GXID8TSpZ649eq+1cG8xQqz9bk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=y54VpLCzQc7w3YFE0LnOfIil7sxmOJJXGIhJ5qPvx/+0zFL/tH5WIiy+VqD7RQWoV
 sblXk682vha3Sf+XiVK5cHdGqqK1ip98g+2cVmhx82ai4Svch0//sDgZgk6zumsb1u
 rajRTndmSQNKh65rb5+ErD4Unz/d1CFcrmDgnCiE=
From: Will Deacon <will@kernel.org>
To: Zhenzhong Duan <zhenzhong.duan@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iommu/vt-d: avoid unnecessory panic if iommu init fail
 in tboot system
Date: Wed, 18 Nov 2020 14:19:20 +0000
Message-Id: <160570494826.3611054.1738553498825865068.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110071908.3133-1-zhenzhong.duan@gmail.com>
References: <20201110071908.3133-1-zhenzhong.duan@gmail.com>
MIME-Version: 1.0
Cc: Will Deacon <will@kernel.org>, catalin.marinas@arm.com, x86@kernel.org,
 iommu@lists.linux-foundation.org, ning.sun@intel.com,
 tboot-devel@lists.sourceforge.net, mingo@redhat.com, bp@alien8.de,
 tglx@linutronix.de, kernel-team@android.com, dwmw2@infradead.org
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

On Tue, 10 Nov 2020 15:19:08 +0800, Zhenzhong Duan wrote:
> "intel_iommu=off" command line is used to disable iommu but iommu is force
> enabled in a tboot system for security reason.
> 
> However for better performance on high speed network device, a new option
> "intel_iommu=tboot_noforce" is introduced to disable the force on.
> 
> By default kernel should panic if iommu init fail in tboot for security
> reason, but it's unnecessory if we use "intel_iommu=tboot_noforce,off".
> 
> [...]

Applied to arm64 (for-next/iommu/fixes), thanks!

[1/1] iommu/vt-d: Avoid panic if iommu init fails in tboot system
      https://git.kernel.org/arm64/c/4d213e76a359

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
