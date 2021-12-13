Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id E72C8472045
	for <lists.iommu@lfdr.de>; Mon, 13 Dec 2021 06:14:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85BF281858;
	Mon, 13 Dec 2021 05:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wKvIREbq-tjI; Mon, 13 Dec 2021 05:14:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AC8DB81842;
	Mon, 13 Dec 2021 05:14:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A543C0039;
	Mon, 13 Dec 2021 05:14:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B0A0C0012
 for <iommu@lists.linux-foundation.org>; Mon, 13 Dec 2021 05:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B4EA81842
 for <iommu@lists.linux-foundation.org>; Mon, 13 Dec 2021 05:14:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ucn1dK_Dxk3o for <iommu@lists.linux-foundation.org>;
 Mon, 13 Dec 2021 05:14:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A501C8183D
 for <iommu@lists.linux-foundation.org>; Mon, 13 Dec 2021 05:14:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3B0C9CE0DAF;
 Mon, 13 Dec 2021 05:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F64C00446;
 Mon, 13 Dec 2021 05:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639372469;
 bh=m+MbzkCsPCJNXsBFySexaUdkbI+fIAKWZPiq+A6GBck=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pcDQjwCHOz6BSONU5joUW6e60Mu1jAbxQzts0EfFaFm5JmSfwPYHyrXe+as4aLjeM
 eFJH1OLum6J0MwbxxotL5Ynx/Wl9FSzFLuVcZ/MiaFGyolmZeXYP0aRrzCZjW5ZdJq
 Yt5fu6OtnruTRf7YSvoSO+XnwngnSyHnpkVidlaQ4C6iMZ9tlspBmToBaYm7+u5kTp
 56ZJujbc1BVH7oROt6l/x3asZi1J9mKWjGd5xEZzFFEQ0GglJh+ze5/cFl0ltz5OnT
 HkJi0GnpAKgWw3QDQFyUKxAUiibgYJ1iBPJwPobSVKG5xk0d9X3x2zWgArHsKu4K1+
 TCjLAS6Yk203w==
Date: Mon, 13 Dec 2021 10:44:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V3 29/35] dmaengine: mv_xor_v2: Get rid of msi_desc abuse
Message-ID: <YbbWsUO6o5ccU5ai@matsya>
References: <20211210221642.869015045@linutronix.de>
 <20211210221814.970099984@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211210221814.970099984@linutronix.de>
Cc: Nishanth Menon <nm@ti.com>, Mark Rutland <mark.rutland@arm.com>,
 Stuart Yoder <stuyoder@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Jassi Brar <jassisinghbrar@gmail.com>,
 Sinan Kaya <okaya@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Jason Gunthorpe <jgg@nvidia.com>, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Cedric Le Goater <clg@kaod.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Megha Dey <megha.dey@intel.com>, Juergen Gross <jgross@suse.com>,
 Tero Kristo <kristo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Marc Zygnier <maz@kernel.org>, dmaengine@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
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

On 10-12-21, 23:19, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> Storing a pointer to the MSI descriptor just to keep track of the Linux
> interrupt number is daft. Use msi_get_virq() instead.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
