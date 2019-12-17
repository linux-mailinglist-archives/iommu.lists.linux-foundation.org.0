Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DBD1227B5
	for <lists.iommu@lfdr.de>; Tue, 17 Dec 2019 10:34:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EBD0385535;
	Tue, 17 Dec 2019 09:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ml0-jcUKVeV; Tue, 17 Dec 2019 09:34:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3813F85429;
	Tue, 17 Dec 2019 09:34:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 241A2C1D84;
	Tue, 17 Dec 2019 09:34:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08330C077D
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 09:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E2A4C204BE
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 09:34:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eo3ZYdQ4+H0K for <iommu@lists.linux-foundation.org>;
 Tue, 17 Dec 2019 09:34:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 4987F20481
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 09:34:30 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id C683B286; Tue, 17 Dec 2019 10:34:28 +0100 (CET)
Date: Tue, 17 Dec 2019 10:34:27 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH 0/2] iommu/amd: Fixes for x2APIC support
Message-ID: <20191217093427.GD8689@8bytes.org>
References: <1574258149-15602-1-git-send-email-suravee.suthikulpanit@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1574258149-15602-1-git-send-email-suravee.suthikulpanit@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

On Wed, Nov 20, 2019 at 07:55:47AM -0600, Suravee Suthikulpanit wrote:
> Adding feature support check for MMIO access to MSI capability
> block registers when enabling x2APIC (XT) mode. Also fix up logic
> for checking XT feature support for IVHD type 10h.
> 
> Suravee Suthikulpanit (2):
>   iommu/amd: Check feature support bit before accessing MSI capability
>     registers
>   iommu/amd: Only support x2APIC with IVHD type 11h/40h

Applied both, thanks Suravee.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
