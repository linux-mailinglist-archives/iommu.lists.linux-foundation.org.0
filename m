Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CF869E0DFF
	for <lists.iommu@lfdr.de>; Wed, 23 Oct 2019 00:01:31 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A28C7CC8;
	Tue, 22 Oct 2019 22:01:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 38A8A41C
	for <iommu@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 22:01:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ale.deltatee.com (ale.deltatee.com [207.54.116.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DE8B7896
	for <iommu@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 22:01:25 +0000 (UTC)
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <gunthorp@deltatee.com>)
	id 1iN2DU-0004Kp-By; Tue, 22 Oct 2019 16:01:25 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
	(envelope-from <gunthorp@deltatee.com>)
	id 1iN2DT-0000Ip-4j; Tue, 22 Oct 2019 16:01:23 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	Joerg Roedel <joro@8bytes.org>
Date: Tue, 22 Oct 2019 16:01:19 -0600
Message-Id: <20191022220121.1120-1-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, joro@8bytes.org,
	kchow@gigaio.com, logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
Subject: [PATCH v2 0/2]  AMD IOMMU Changes for NTB
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: Logan Gunthorpe <logang@deltatee.com>, Kit Chow <kchow@gigaio.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi,

Please find the following patches which help support
Non-Transparent-Bridge (NTB) devices on AMD platforms with the IOMMU
enabled.

These patches add support for multiple PCI aliases. NTB
hardware will normally send TLPs from a range of requestor IDs to
facilitate routing the responses back to the correct requestor on the
other side of the bridge. To support this, NTB hardware registers a
number of PCI aliases. Currently the AMD IOMMU only allows for one
PCI alias so TLPs from the other aliases get rejected.

See commit ad281ecf1c7d ("PCI: Add DMA alias quirk for Microsemi
Switchtec NTB") for more information on this.

Similar patches were upstreamed for Intel hardware earlier this year:

commit 3f0c625c6ae7 ("iommu/vt-d: Allow interrupts from the entire bus
    for aliased devices")

Thanks,

Logan

--

Changes since v1:
  * Dropped the first patch as similar functionality has already
    been added with the generic iommu interface
  * Rebased onto joro/iommu.git next branch
  * Reworked the set_remap_table_entry_alias() function to also do
    the flushing by getting the iommu from amd_iommu_rlookup_table
    (per suggestion from Joerg)

Logan Gunthorpe (2):
  iommu/amd: Support multiple PCI DMA aliases in device table
  iommu/amd: Support multiple PCI DMA aliases in IRQ Remapping

 drivers/iommu/amd_iommu.c       | 170 +++++++++++++++++---------------
 drivers/iommu/amd_iommu_types.h |   2 +-
 2 files changed, 92 insertions(+), 80 deletions(-)

--
2.20.1
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
