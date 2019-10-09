Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF45D1C41
	for <lists.iommu@lfdr.de>; Thu, 10 Oct 2019 00:54:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A0AD7E1E;
	Wed,  9 Oct 2019 22:54:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BC8B5ACC
	for <iommu@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 22:54:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8A23F14D
	for <iommu@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 22:54:06 +0000 (UTC)
Received: from localhost (unknown [69.71.4.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 154F720B7C;
	Wed,  9 Oct 2019 22:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570661646;
	bh=sdfemJxxgR9nam3jxP3yXjTQgeUBVv43xAUwHlO8Jxo=;
	h=From:To:Cc:Subject:Date:From;
	b=NmoDk2HHXhhOGxdgynuutsxQF0YQbg8l1iMhjGAkcFoPvS2O0rg/W4MRdntr8S+9Y
	Q44FGQFM8UDw5I02IsVBviDBenPqo9UwPHIat63AIEE5KnS3cfBulgz+7jMzw/atGF
	0jmOs+fccjzbWF5OceVE+1EoblPyUxkL0g66HcdI=
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org
Subject: [PATCH 0/3] PCI/ATS: Clean up unnecessary stubs and exports
Date: Wed,  9 Oct 2019 17:53:51 -0500
Message-Id: <20191009225354.181018-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
MIME-Version: 1.0
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Krzysztof Wilczynski <kw@linux.com>, Ashok Raj <ashok.raj@intel.com>,
	linux-kernel@vger.kernel.org, Keith Busch <keith.busch@intel.com>,
	iommu@lists.linux-foundation.org, Bjorn Helgaas <bhelgaas@google.com>,
	David Woodhouse <dwmw2@infradead.org>
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

From: Bjorn Helgaas <bhelgaas@google.com>

Most of the ATS/PRI/PASID interfaces are only used by IOMMU drivers that
can only be built statically, not as modules.  A couple are only used by
the PCI core and don't need to be visible outside at all.

These are intended to be cleanup only, but let me know if they would break
something.

Bjorn Helgaas (3):
  PCI/ATS: Remove unused PRI and PASID stubs
  PCI/ATS: Remove unnecessary EXPORT_SYMBOL_GPL()
  PCI/ATS: Make pci_restore_pri_state(), pci_restore_pasid_state()
    private

 drivers/pci/ats.c       | 14 --------------
 drivers/pci/pci.h       |  4 ++++
 include/linux/pci-ats.h | 15 ---------------
 3 files changed, 4 insertions(+), 29 deletions(-)

-- 
2.23.0.581.g78d2f28ef7-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
