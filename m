Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A94340174
	for <lists.iommu@lfdr.de>; Thu, 18 Mar 2021 10:07:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CA9A6060D;
	Thu, 18 Mar 2021 09:07:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fJGpRoCCu6_N; Thu, 18 Mar 2021 09:07:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CAE660693;
	Thu, 18 Mar 2021 09:07:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5ADD2C0001;
	Thu, 18 Mar 2021 09:07:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83F82C0001
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 09:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6021460667
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 09:07:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mCZmRGgz2YsO for <iommu@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 09:07:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5AD66060D
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 09:07:43 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 92B822D8; Thu, 18 Mar 2021 10:07:40 +0100 (CET)
Date: Thu, 18 Mar 2021 10:07:38 +0100
From: "joro@8bytes.org" <joro@8bytes.org>
To: "Derrick, Jonathan" <jonathan.derrick@intel.com>
Subject: Re: [PATCH v4 0/2] VMD MSI Remapping Bypass
Message-ID: <YFMYWrghas6og2pN@8bytes.org>
References: <20210210161315.316097-1-jonathan.derrick@intel.com>
 <0a70914085c25cf99536d106a280b27819328fff.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a70914085c25cf99536d106a280b27819328fff.camel@intel.com>
Cc: "kw@linux.com" <kw@linux.com>, "Patel, Nirmal" <nirmal.patel@intel.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "Karkra,
 Kapil" <kapil.karkra@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "helgaas@kernel.org" <helgaas@kernel.org>
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

On Wed, Mar 17, 2021 at 07:14:17PM +0000, Derrick, Jonathan wrote:
> Gentle reminder, for v5.13 ?

This should go through the PCI tree, Bjorn?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
