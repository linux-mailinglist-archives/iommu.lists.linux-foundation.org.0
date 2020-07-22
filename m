Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EF1229820
	for <lists.iommu@lfdr.de>; Wed, 22 Jul 2020 14:19:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B198B864E6;
	Wed, 22 Jul 2020 12:19:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1IBs2TPWArev; Wed, 22 Jul 2020 12:19:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E404B86473;
	Wed, 22 Jul 2020 12:19:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CBC85C0051;
	Wed, 22 Jul 2020 12:19:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6EDDC004C
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 12:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CE748203D0
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 12:19:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ccK4qNCCT6Il for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 12:19:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 6672920425
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 12:19:27 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E53622C8; Wed, 22 Jul 2020 14:19:23 +0200 (CEST)
Date: Wed, 22 Jul 2020 14:19:22 +0200
From: "joro@8bytes.org" <joro@8bytes.org>
To: "Sironi, Filippo" <sironi@amazon.de>
Subject: Re: [PATCH v2 0/3] iommu/amd: I/O VA address limits
Message-ID: <20200722121922.GY27672@8bytes.org>
References: <20200630093039.GC28824@8bytes.org>
 <20200630224634.319-1-sebott@amazon.de>
 <20200710123059.GF27672@8bytes.org>
 <751e403f-7095-f761-465b-9e187b423b0b@amazon.de>
 <271d67b2-482e-7a16-8fd7-1f1a6a4bdff2@arm.com>
 <2a04dcca86bdccece6e0109c30fc0262e1bf8829.camel@amazon.de>
 <004a060f-823d-af4e-a34d-1ff029faa40f@arm.com>
 <715c45b76f49b732e5f20157945d2ae262654602.camel@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <715c45b76f49b732e5f20157945d2ae262654602.camel@amazon.de>
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

On Fri, Jul 17, 2020 at 03:15:43PM +0000, Sironi, Filippo wrote:
> I don't believe that we want to trust a userspace driver here, this may
> result in hosts becoming unstable because devices are asked to do things
> they aren't meant to do (e.g., DMA beyond 48 bits).

How is the hosts stability affected when a device is programmed with
handles outside of its DMA mask?

Anyway, someone needs to know how to use the device in the end, and this
entity also needs to know the DMA mask of the device and pass it down to
path to the dma-iommu code.

Regards,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
