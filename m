Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id ED85E2F9E05
	for <lists.iommu@lfdr.de>; Mon, 18 Jan 2021 12:25:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AF67387013;
	Mon, 18 Jan 2021 11:25:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gr2NITP1pA2I; Mon, 18 Jan 2021 11:25:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4BE4387011;
	Mon, 18 Jan 2021 11:25:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A393C013A;
	Mon, 18 Jan 2021 11:25:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2BF08C013A
 for <iommu@lists.linux-foundation.org>; Mon, 18 Jan 2021 11:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 285A286668
 for <iommu@lists.linux-foundation.org>; Mon, 18 Jan 2021 11:25:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9DiKvlxuVV2v for <iommu@lists.linux-foundation.org>;
 Mon, 18 Jan 2021 11:25:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 96223861D4
 for <iommu@lists.linux-foundation.org>; Mon, 18 Jan 2021 11:25:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26572222B3;
 Mon, 18 Jan 2021 11:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610969113;
 bh=60sJm+mImpf9L23Pcs9uk0teq7X8qJVeYIkzxo748s4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FLUNfs0/W9izTS6EAfZw+31Om3TaNq7HJm6Z4VCCQRLTVTbo3t5VJEoAtl+uasoOt
 Rn+Xw+PUrq1aG9+zMhSvTnOxFsiOQFIJAMav+/3wgX3/31sF8jA7q09aIyLNazJupM
 SPER02IgQ1mHJo0Hnm2pftkseErgeK7fGPDL9d+gWYa380ivgs0jmkHN4YtN08qzce
 BC0UCvP79gNEeO79ShOt5FmR9+VABwEMkTkO/PhqiHwulUt2A4lA54SHaiDFUL1OCi
 Vbt3xHuyNvXOGp0eQYVNvM1t0BBlI5QvtuRfluapYBaFKtXgJFocZTtaIG6weXQSUW
 h5HsDR5jn35jQ==
Date: Mon, 18 Jan 2021 11:25:08 +0000
From: Will Deacon <will@kernel.org>
To: Adrian Huang <adrianhuang0701@gmail.com>
Subject: Re: [RESEND PATCH 1/1] iommu/amd: Remove unnecessary assignment
Message-ID: <20210118112508.GB16500@willie-the-truck>
References: <20201210021330.2022-1-adrianhuang0701@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210021330.2022-1-adrianhuang0701@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Adrian Huang <ahuang12@lenovo.com>, iommu@lists.linux-foundation.org
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

On Thu, Dec 10, 2020 at 10:13:30AM +0800, Adrian Huang wrote:
> From: Adrian Huang <ahuang12@lenovo.com>
> 
> From: Adrian Huang <ahuang12@lenovo.com>
> 
> The values of local variables are assigned after local variables
> are declared, so no need to assign the initial value during the
> variable declaration.
> 
> And, no need to assign NULL for the local variable 'ivrs_base'
> after invoking acpi_put_table().
> 
> Signed-off-by: Adrian Huang <ahuang12@lenovo.com>
> ---
>  drivers/iommu/amd/init.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
