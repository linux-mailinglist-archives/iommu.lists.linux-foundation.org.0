Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E56171A3A87
	for <lists.iommu@lfdr.de>; Thu,  9 Apr 2020 21:32:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 55A3387F81;
	Thu,  9 Apr 2020 19:32:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OHu+R3Pn3OYI; Thu,  9 Apr 2020 19:32:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7532687F35;
	Thu,  9 Apr 2020 19:32:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 585B5C0177;
	Thu,  9 Apr 2020 19:32:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1A196C0177
 for <iommu@lists.linux-foundation.org>; Thu,  9 Apr 2020 19:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0F9F287BC8
 for <iommu@lists.linux-foundation.org>; Thu,  9 Apr 2020 19:32:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K61L-EI6QmAl for <iommu@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 19:32:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 829EC87B5D
 for <iommu@lists.linux-foundation.org>; Thu,  9 Apr 2020 19:32:24 +0000 (UTC)
IronPort-SDR: x84CTi+QlZ6Ios1llc+TizKTzurwSRMjhKLSvd59zzTXJ8WxK3mASYrxC5Dgpsab8iAvrU1pHF
 AVD3kpY1psEA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 12:32:22 -0700
IronPort-SDR: FcOz2aKwDMUhIQvHop9Zpt0cOYquXgeCrNF7hCJY+gyODlZuB+JF9XbErfROwv238uifDji3OB
 1QnJ132mntlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; d="scan'208";a="452116450"
Received: from unknown (HELO localhost.lm.intel.com) ([10.232.116.40])
 by fmsmga005.fm.intel.com with ESMTP; 09 Apr 2020 12:32:21 -0700
From: Jon Derrick <jonathan.derrick@intel.com>
To: Joerg Roedel <joro@8bytes.org>,
	<iommu@lists.linux-foundation.org>
Subject: [PATCH 0/1] Real DMA dev DMA domain patch
Date: Thu,  9 Apr 2020 15:17:35 -0400
Message-Id: <20200409191736.6233-1-jonathan.derrick@intel.com>
X-Mailer: git-send-email 2.18.1
Cc: linux-pci@vger.kernel.org, Daniel Drake <drake@endlessm.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux@endlessm.com,
 Jon Derrick <jonathan.derrick@intel.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Sorry for the late patch here, but I hit the issue Baolu and Daniel
pointed out could occur, and requires this fix (or iommu=nopt).
Hoping to get it into an rc

Jon Derrick (1):
  iommu/vt-d: use DMA domain for real DMA devices and subdevices

 drivers/iommu/intel-iommu.c | 56 ++++++++++++++++++++++++++++---------
 1 file changed, 43 insertions(+), 13 deletions(-)

-- 
2.18.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
