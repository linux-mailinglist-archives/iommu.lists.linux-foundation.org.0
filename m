Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 971882EBDC6
	for <lists.iommu@lfdr.de>; Wed,  6 Jan 2021 13:34:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 076F822F05;
	Wed,  6 Jan 2021 12:34:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OaV+LKHVP68W; Wed,  6 Jan 2021 12:34:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E85DC22D22;
	Wed,  6 Jan 2021 12:34:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BF242C1E6F;
	Wed,  6 Jan 2021 12:34:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4292C013A
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jan 2021 12:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CDF8986FB1
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jan 2021 12:34:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Aln7rIXOpYJW for <iommu@lists.linux-foundation.org>;
 Wed,  6 Jan 2021 12:34:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4C80086FBE
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jan 2021 12:34:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E89C22B45;
 Wed,  6 Jan 2021 12:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609936476;
 bh=WgvS4tF0ZWeikogI4MPn+X49EO/EQE73OKs1GUuXPQE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lPOUFq+XVi71GLdZCBjNfOCg1jfxK8gz0CU5GEub44Xa0fymuPVqY+UyLAUMNkVV5
 tqurSMZBFf+ZQQOeYLM3tG3OlRH+AWQkDEuwuPtl2YfFwO6kKQxs8KCziudccpJE/2
 l7EFTWJozxaQ7TEKT6ApaQyqYV8QZqwCIUYwneBiZgEbQ+Q44YtEfDf2qfSKI6bgSv
 K3vTBX86Ty9irVqM8ZRMW3RLKRmrhcBGmkRpIUbAqsgiZg4gjXh7n/CBk/mhvvQyOn
 RRDdZppLVeAqtS5DxGTGWcUDjBI+cifQNPDdlYjApjy28uyWFHEl2x/3X5aa3vRXU6
 AJVD3+2E0ewsQ==
Date: Wed, 6 Jan 2021 12:34:28 +0000
From: Will Deacon <will@kernel.org>
To: "Isaac J. Manjarres" <isaacm@codeaurora.org>
Subject: Re: [PATCH RESEND 0/7] iommu: Permit modular builds of io-pgtable
 drivers
Message-ID: <20210106123428.GA1798@willie-the-truck>
References: <1609832205-10055-1-git-send-email-isaacm@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1609832205-10055-1-git-send-email-isaacm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, kernel-team@android.com, tomeu.vizoso@collabora.com,
 pdaly@codeaurora.org, airlied@linux.ie, robin.murphy@arm.com,
 iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com, daniel@ffwll.ch,
 freedreno@lists.freedesktop.org, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org, pratikp@codeaurora.org
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

On Mon, Jan 04, 2021 at 11:36:38PM -0800, Isaac J. Manjarres wrote:
> The goal of the Generic Kernel Image (GKI) effort is to have a common
> kernel image that works across multiple Android devices. This involves
> generating a kernel image that has core features integrated into it,
> while SoC specific functionality can be added to the kernel for the
> device as a module.
> 
> Along with modularizing IOMMU drivers, this also means building the
> io-pgtable code as modules, which allows for SoC vendors to only include
> the io-pgtable implementations that they use. For example, GKI for arm64
> must include support for both the IOMMU ARM LPAE/V7S formats at the
> moment. Having the code for both formats as modules allows SoC vendors
> to only provide the page table format that they use, along with their
> IOMMU driver.

Why is this desirable for upstream? This code isn't especially large, and
the formats we support are largely architectural, meaning that they are
shared between different IOMMU drivers. I think that making this modular
just means that out-of-tree modifications are likely to generate page-tables
which are specific to a particular IOMMU, and lead to horrible problems
(crashes and data corruption) if another IOMMU driver tries to use them.

Please can you upstream whatever changes you want to make instead?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
