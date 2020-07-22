Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 610242299A5
	for <lists.iommu@lfdr.de>; Wed, 22 Jul 2020 16:00:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DD285868F5;
	Wed, 22 Jul 2020 14:00:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yIpxelgccVFy; Wed, 22 Jul 2020 14:00:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 52890868E8;
	Wed, 22 Jul 2020 14:00:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2FF5BC0051;
	Wed, 22 Jul 2020 14:00:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B6D1C004C
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 14:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 03EBA868F5
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 14:00:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 312x_ajNYhQE for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 14:00:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2A8A1868E8
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 14:00:33 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 55CD32C8; Wed, 22 Jul 2020 16:00:31 +0200 (CEST)
Date: Wed, 22 Jul 2020 16:00:30 +0200
From: "joro@8bytes.org" <joro@8bytes.org>
To: "Sironi, Filippo" <sironi@amazon.de>
Subject: Re: [PATCH v2 0/3] iommu/amd: I/O VA address limits
Message-ID: <20200722140029.GI27672@8bytes.org>
References: <20200630093039.GC28824@8bytes.org>
 <20200630224634.319-1-sebott@amazon.de>
 <20200710123059.GF27672@8bytes.org>
 <751e403f-7095-f761-465b-9e187b423b0b@amazon.de>
 <271d67b2-482e-7a16-8fd7-1f1a6a4bdff2@arm.com>
 <2a04dcca86bdccece6e0109c30fc0262e1bf8829.camel@amazon.de>
 <004a060f-823d-af4e-a34d-1ff029faa40f@arm.com>
 <715c45b76f49b732e5f20157945d2ae262654602.camel@amazon.de>
 <20200722121922.GY27672@8bytes.org>
 <88c26491f2e429380028e9c04755965bc3f0341a.camel@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88c26491f2e429380028e9c04755965bc3f0341a.camel@amazon.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "Serebrin, Benjamin" <serebrin@amazon.com>,
 "sebott@amazon.de" <sebott@amazon.de>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
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

On Wed, Jul 22, 2020 at 12:34:57PM +0000, Sironi, Filippo wrote:
> On Wed, 2020-07-22 at 14:19 +0200, joro@8bytes.org wrote:

> I wouldn't be surprised if a PCIe device raises a PCIe SERR if it is
> asked to do DMA beyond its abilities.

Yeah, but that would also make it impossible to safely assign the device
to any untrusted entity, like a guest of user-space driver.

> I think that this discussion is orthogonal wrt the spirit of the
> patches. They are actually adding a few bits to the AMD IOMMU driver
> (and propagating them to the right places) to implement a portion of the
> specification that wasn't implemented, i.e., relying on the IVRS table.
> These patches are valuable independently on the content of the IVRS
> table, be it 32, 48, or 64 bits.

You are right from a technical point of view, and the patches are as
well. The problem I see is that there are a lot of systems out there
with an AMD IOMMU and possibly broken ACPI tables. And if the driver
starts checking this field now it is possible that it breaks formerly
working setups.

So doing this needs a strong reason, like upcoming hardware that has
lower limits in the supported address space size than before. The
use-case you have described is not a strong enough reason to take the
risk.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
