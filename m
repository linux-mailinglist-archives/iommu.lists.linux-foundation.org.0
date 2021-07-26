Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7453D5968
	for <lists.iommu@lfdr.de>; Mon, 26 Jul 2021 14:25:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94251402C5;
	Mon, 26 Jul 2021 12:25:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yPg-pmRW-deu; Mon, 26 Jul 2021 12:25:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E449540137;
	Mon, 26 Jul 2021 12:25:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE754C001F;
	Mon, 26 Jul 2021 12:25:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8ED3BC000E
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 12:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CE4C60752
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 12:25:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y8Eu8JhhdV6W for <iommu@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 12:25:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD4FD605C9
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 12:25:42 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 6D7EE2B0; Mon, 26 Jul 2021 14:25:40 +0200 (CEST)
Date: Mon, 26 Jul 2021 14:25:39 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Kyung Min Park <kyung.min.park@intel.com>
Subject: Re: [PATCH v2] iommu/vt-d: Dump DMAR translation structure
Message-ID: <YP6pw9j8i3bGOb13@8bytes.org>
References: <20210722042453.10579-1-kyung.min.park@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210722042453.10579-1-kyung.min.park@intel.com>
Cc: ravi.v.shankar@intel.com, ashok.raj@intel.com, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 will@kernel.org
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

On Wed, Jul 21, 2021 at 09:24:53PM -0700, Kyung Min Park wrote:
> When the dmar translation fault happens, the kernel prints a single line
> fault reason with corresponding hexadecimal code defined in the Intel VT-d
> specification.
> 
> Currently, when user wants to debug the translation fault in detail,
> debugfs is used for dumping the dmar_translation_struct, which is not
> available when the kernel failed to boot.
> 
> Dump the DMAR translation structure, pagewalk the IO page table and print
> the page table entry when the fault happens.
> 
> Signed-off-by: Kyung Min Park <kyung.min.park@intel.com>

This is too much noise in dmesg for a single dmar fault. Please hide
that additional debug information behind a debug kernel option for the
VT-d driver.

Thanks,
	
	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
