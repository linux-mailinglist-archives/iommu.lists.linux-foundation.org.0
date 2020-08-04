Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7B823B8D9
	for <lists.iommu@lfdr.de>; Tue,  4 Aug 2020 12:35:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CB1F086CE1;
	Tue,  4 Aug 2020 10:35:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o3m+XEncgnoR; Tue,  4 Aug 2020 10:35:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3FA6E86B33;
	Tue,  4 Aug 2020 10:35:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2257FC004C;
	Tue,  4 Aug 2020 10:35:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B09DBC004C
 for <iommu@lists.linux-foundation.org>; Tue,  4 Aug 2020 10:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9D388860CD
 for <iommu@lists.linux-foundation.org>; Tue,  4 Aug 2020 10:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B41iVpLWfE0n for <iommu@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 10:35:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D6770860C0
 for <iommu@lists.linux-foundation.org>; Tue,  4 Aug 2020 10:35:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBBA01FB;
 Tue,  4 Aug 2020 03:35:06 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com
 [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E93413F718;
 Tue,  4 Aug 2020 03:35:05 -0700 (PDT)
Date: Tue, 4 Aug 2020 11:34:57 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: kvm@vger.kernel.org, linux-pci@vger.kernel.org,
 iommu@lists.linux-foundation.org
Subject: VFIO/IOMMU/PCI MC at LPC20 - Call for Topics
Message-ID: <20200804103457.GA6930@e121166-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alex.williamson@redhat.com, helgaas@kernel.org
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

Hi all,

following up the LPC20 blog announcement:

https://www.linuxplumbersconf.org/blog/2020/vfio-iommu-pci-microconference-accepted-into-2020-linux-plumbers-conference/

The call for topics for the VFIO/IOMMU/PCI microconference at LPC20 is
now open, the LPC20 entry below provides a list of possible topics but
you should feel free to submit topics of interest that you would like to
discuss with maintainers and developers of the respective subsystems.

https://www.linuxplumbersconf.org/event/7/page/80-accepted-microconferences#vfio-cr

Please do reach out for any other piece of information we can help with.

Looking forward to receiving your submissions !

Thanks,
Lorenzo
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
