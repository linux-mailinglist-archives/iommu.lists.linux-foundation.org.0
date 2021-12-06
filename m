Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAE94697A9
	for <lists.iommu@lfdr.de>; Mon,  6 Dec 2021 15:01:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 957D660773;
	Mon,  6 Dec 2021 14:01:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xBMAw92YjX_n; Mon,  6 Dec 2021 14:01:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 897B06074E;
	Mon,  6 Dec 2021 14:01:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5ABF3C0012;
	Mon,  6 Dec 2021 14:01:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9BCEC0012
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 14:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB7E440921
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 14:01:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pzjE-6ogKrls for <iommu@lists.linux-foundation.org>;
 Mon,  6 Dec 2021 14:01:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 897D540919
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 14:01:23 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 8775F396; Mon,  6 Dec 2021 15:01:20 +0100 (CET)
Date: Mon, 6 Dec 2021 15:01:19 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH 0/5] iommu/amd: fixes for suspend/resume
Message-ID: <Ya4XrxbcXvdQv0kp@8bytes.org>
References: <20211123161038.48009-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211123161038.48009-1-mlevitsk@redhat.com>
Cc: linux-kernel@vger.kernel.org,
 "open list:AMD IOMMU \(AMD-VI\)" <iommu@lists.linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 David Woodhouse <dwmw@amazon.co.uk>
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

On Tue, Nov 23, 2021 at 06:10:33PM +0200, Maxim Levitsky wrote:
> Best regards,
>    Maxim Levitsky
> 
> Maxim Levitsky (5):
>   iommu/amd: restore GA log/tail pointer on host resume
>   iommu/amd: x2apic mode: re-enable after resume
>   iommu/amd: x2apic mode: setup the INTX registers on mask/unmask
>   iommu/amd: x2apic mode: mask/unmask interrupts on suspend/resume
>   iommu/amd: remove useless irq affinity notifier
> 
>  drivers/iommu/amd/amd_iommu_types.h |   2 -
>  drivers/iommu/amd/init.c            | 107 +++++++++++++++-------------
>  2 files changed, 58 insertions(+), 51 deletions(-)

Suravee, can you please have a look? These look like v5.16 material.

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
