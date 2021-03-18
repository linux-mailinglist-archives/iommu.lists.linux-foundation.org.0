Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id C55DD3405A1
	for <lists.iommu@lfdr.de>; Thu, 18 Mar 2021 13:38:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 545C56F998;
	Thu, 18 Mar 2021 12:38:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PiS15pCgsKh0; Thu, 18 Mar 2021 12:38:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7130C6F840;
	Thu, 18 Mar 2021 12:38:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46D36C000C;
	Thu, 18 Mar 2021 12:38:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44F6AC0001
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 12:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 259616F840
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 12:38:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 44btvBmbr1dd for <iommu@lists.linux-foundation.org>;
 Thu, 18 Mar 2021 12:38:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16AB2606A9
 for <iommu@lists.linux-foundation.org>; Thu, 18 Mar 2021 12:38:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CB1831B;
 Thu, 18 Mar 2021 05:38:23 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com
 [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 158C53F718;
 Thu, 18 Mar 2021 05:38:21 -0700 (PDT)
Date: Thu, 18 Mar 2021 12:38:17 +0000
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: "joro@8bytes.org" <joro@8bytes.org>
Subject: Re: [PATCH v4 0/2] VMD MSI Remapping Bypass
Message-ID: <20210318123817.GA27487@e121166-lin.cambridge.arm.com>
References: <20210210161315.316097-1-jonathan.derrick@intel.com>
 <0a70914085c25cf99536d106a280b27819328fff.camel@intel.com>
 <YFMYWrghas6og2pN@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFMYWrghas6og2pN@8bytes.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "kw@linux.com" <kw@linux.com>, "Patel, Nirmal" <nirmal.patel@intel.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "Karkra,
 Kapil" <kapil.karkra@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "helgaas@kernel.org" <helgaas@kernel.org>, "Derrick,
 Jonathan" <jonathan.derrick@intel.com>
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

On Thu, Mar 18, 2021 at 10:07:38AM +0100, joro@8bytes.org wrote:
> On Wed, Mar 17, 2021 at 07:14:17PM +0000, Derrick, Jonathan wrote:
> > Gentle reminder, for v5.13 ?
> 
> This should go through the PCI tree, Bjorn?

I will start queuing code next week, noted.

Thanks,
Lorenzo
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
