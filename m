Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A02892238E5
	for <lists.iommu@lfdr.de>; Fri, 17 Jul 2020 12:03:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 15E8E88086;
	Fri, 17 Jul 2020 10:03:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h4l5-vU2v2mP; Fri, 17 Jul 2020 10:03:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C51E088085;
	Fri, 17 Jul 2020 10:03:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6D07C0733;
	Fri, 17 Jul 2020 10:03:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 704B0C0733
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jul 2020 10:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5490B20475
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jul 2020 10:03:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8N6JwXaMV3Mx for <iommu@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 10:03:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id DDECB2043F
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jul 2020 10:03:44 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 847C12076A;
 Fri, 17 Jul 2020 10:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594980224;
 bh=AjmrtslKmwX/6PMA4+8pzIsPlXZYlwjTJ2i/lkpv7EI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0HOWqPq7Xb6a4IP4VN2D6+4wU2bfE7MkxqiblCPE/mlCsFKsb1nHocBy0S6ckTenx
 vjcn55OkAGmZtsR2bQgTQ8loJ3UMMFEBNzJglNPAzMuIwrGvp12AJiLpv2XOpkvd2A
 10Af/T/FlmIlYB+IMR60aNjx+i8kzW7XFA+Q/SmI=
Date: Fri, 17 Jul 2020 11:03:38 +0100
From: Will Deacon <will@kernel.org>
To: Krishna Reddy <vdumpa@nvidia.com>
Subject: Re: [PATCH v10 0/5] NVIDIA ARM SMMU Implementation
Message-ID: <20200717100337.GA8673@willie-the-truck>
References: <20200708050017.31563-1-vdumpa@nvidia.com>
 <20200713135020.GD2739@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200713135020.GD2739@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: snikam@nvidia.com, devicetree@vger.kernel.org, mperttunen@nvidia.com,
 praithatha@nvidia.com, bhuntsman@nvidia.com, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, talho@nvidia.com, iommu@lists.linux-foundation.org,
 robh+dt@kernel.org, nicolinc@nvidia.com, linux-tegra@vger.kernel.org,
 yhsu@nvidia.com, treding@nvidia.com, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, bbiswas@nvidia.com
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

On Mon, Jul 13, 2020 at 02:50:20PM +0100, Will Deacon wrote:
> On Tue, Jul 07, 2020 at 10:00:12PM -0700, Krishna Reddy wrote:
> > Changes in v10:
> > Perform SMMU base ioremap before calling implementation init.
> > Check for Global faults across both ARM MMU-500s during global interrupt.
> > Check for context faults across all contexts of both ARM MMU-500s during context fault interrupt.
> > Add new DT binding nvidia,smmu-500 for NVIDIA implementation.
> 
> Please repost based on my SMMU queue, as this doesn't currently apply.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-joerg/arm-smmu/updates

Any update on this, please? It would be a shame to miss 5.9 now that the
patches look alright.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
