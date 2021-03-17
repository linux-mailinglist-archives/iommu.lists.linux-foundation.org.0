Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D983F33F284
	for <lists.iommu@lfdr.de>; Wed, 17 Mar 2021 15:24:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EB3960698;
	Wed, 17 Mar 2021 14:24:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wstXVvxQrHXq; Wed, 17 Mar 2021 14:24:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6C4F60594;
	Wed, 17 Mar 2021 14:24:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D09AC0011;
	Wed, 17 Mar 2021 14:24:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 196D0C0001
 for <iommu@lists.linux-foundation.org>; Wed, 17 Mar 2021 14:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F38F14ED67
 for <iommu@lists.linux-foundation.org>; Wed, 17 Mar 2021 14:24:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MkcqkSA6Smof for <iommu@lists.linux-foundation.org>;
 Wed, 17 Mar 2021 14:24:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D7F54EBFB
 for <iommu@lists.linux-foundation.org>; Wed, 17 Mar 2021 14:24:50 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id B857A3A4; Wed, 17 Mar 2021 15:24:47 +0100 (CET)
Date: Wed, 17 Mar 2021 15:24:46 +0100
From: Joerg Roedel <joro@8bytes.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 2/3] iommu/amd: Don't call early_amd_iommu_init() when
 AMD IOMMU is disabled
Message-ID: <YFIRLh3PPiW1hCQZ@8bytes.org>
References: <20210317091037.31374-1-joro@8bytes.org>
 <20210317091037.31374-3-joro@8bytes.org>
 <449d4a2d192d23eb504e43b13c35c326f2d0309a.camel@infradead.org>
 <YFIE8xnr/HWqxm4p@8bytes.org>
 <3014DA56-84D8-474B-94FE-6FDBB6241F9F@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3014DA56-84D8-474B-94FE-6FDBB6241F9F@infradead.org>
Cc: Joerg Roedel <jroedel@suse.de>, Xiaojian Du <xiaojian.du@amd.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 iommu@lists.linux-foundation.org, Huang Rui <ray.huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
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

On Wed, Mar 17, 2021 at 01:37:16PM +0000, David Woodhouse wrote:
> If we can get to the point where we don't even need to check
> amd_iommu_irq_remap in the ...select() function because the IRQ domain
> is never even registered in the case where the flag ends up false, all
> the better :)

This should already be achieved with this patch :)

But the check is still needed if something goes wrong during IOMMU
initialization. In this case the IOMMUs are teared down and the memory
is freed. But the IRQ domains stay registered for now, mostly because
the upper-level APIs to register them lack a deregister function.

I havn't looked into the details yet whether it is suffient to call
irq_domain_remove() on a domain created with
arch_create_remap_msi_irq_domain() for example. This needs more research
on my side :)

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
