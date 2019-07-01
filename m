Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFFB28D02
	for <lists.iommu@lfdr.de>; Fri, 24 May 2019 00:31:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E25D11172;
	Thu, 23 May 2019 22:31:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AEA18F73
	for <iommu@lists.linux-foundation.org>;
	Thu, 23 May 2019 22:31:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from ale.deltatee.com (ale.deltatee.com [207.54.116.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 43EA884F
	for <iommu@lists.linux-foundation.org>;
	Thu, 23 May 2019 22:31:11 +0000 (UTC)
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <gunthorp@deltatee.com>)
	id 1hTwEs-00062Q-Eu; Thu, 23 May 2019 16:31:10 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.89)
	(envelope-from <gunthorp@deltatee.com>)
	id 1hTwEq-0001SB-0u; Thu, 23 May 2019 16:31:04 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-ntb@googlegroups.com,
	linux-pci@vger.kernel.org, iommu@lists.linux-foundation.org,
	linux-kselftest@vger.kernel.org, Jon Mason <jdmason@kudzu.us>,
	Joerg Roedel <joro@8bytes.org>
Date: Thu, 23 May 2019 16:30:54 -0600
Message-Id: <20190523223100.5526-5-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523223100.5526-1-logang@deltatee.com>
References: <20190523223100.5526-1-logang@deltatee.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-ntb@googlegroups.com, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kselftest@vger.kernel.org, jdmason@kudzu.us,
	joro@8bytes.org, bhelgaas@google.com, dave.jiang@intel.com,
	allenbh@gmail.com, fancer.lancer@gmail.com, epilmore@gigaio.com,
	logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
Subject: [PATCH v5 04/10] NTB: Introduce functions to calculate multi-port
	resource index
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: Allen Hubbe <allenbh@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
	Serge Semin <fancer.lancer@gmail.com>, Eric Pilmore <epilmore@gigaio.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>
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

When using multi-ports each port uses resources (dbs, msgs, mws, etc)
on every other port. Creating a mapping for these resources such that
each port has a corresponding resource on every other port is a bit
tricky.

Introduce the ntb_peer_resource_idx() function for this purpose.
It returns the peer resource number that will correspond with the
local peer index on the remote peer.

Also, introduce ntb_peer_highest_mw_idx() which will use
ntb_peer_resource_idx() but return the MW index starting with the
highest index and working down.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Jon Mason <jdmason@kudzu.us>
Cc: Dave Jiang <dave.jiang@intel.com>
Cc: Allen Hubbe <allenbh@gmail.com>
---
 include/linux/ntb.h | 70 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/include/linux/ntb.h b/include/linux/ntb.h
index 91cf492b16a0..66552830544b 100644
--- a/include/linux/ntb.h
+++ b/include/linux/ntb.h
@@ -1557,4 +1557,74 @@ static inline int ntb_peer_msg_write(struct ntb_dev *ntb, int pidx, int midx,
 	return ntb->ops->peer_msg_write(ntb, pidx, midx, msg);
 }
 
+/**
+ * ntb_peer_resource_idx() - get a resource index for a given peer idx
+ * @ntb:	NTB device context.
+ * @pidx:	Peer port index.
+ *
+ * When constructing a graph of peers, each remote peer must use a different
+ * resource index (mw, doorbell, etc) to communicate with each other
+ * peer.
+ *
+ * In a two peer system, this function should always return 0 such that
+ * resource 0 points to the remote peer on both ports.
+ *
+ * In a 5 peer system, this function will return the following matrix
+ *
+ * pidx \ port    0    1    2    3    4
+ * 0              0    0    1    2    3
+ * 1              0    1    1    2    3
+ * 2              0    1    2    2    3
+ * 3              0    1    2    3    3
+ *
+ * For example, if this function is used to program peer's memory
+ * windows, port 0 will program MW 0 on all it's peers to point to itself.
+ * port 1 will program MW 0 in port 0 to point to itself and MW 1 on all
+ * other ports. etc.
+ *
+ * For the legacy two host case, ntb_port_number() and ntb_peer_port_number()
+ * both return zero and therefore this function will always return zero.
+ * So MW 0 on each host would be programmed to point to the other host.
+ *
+ * Return: the resource index to use for that peer.
+ */
+static inline int ntb_peer_resource_idx(struct ntb_dev *ntb, int pidx)
+{
+	int local_port, peer_port;
+
+	if (pidx >= ntb_peer_port_count(ntb))
+		return -EINVAL;
+
+	local_port = ntb_logical_port_number(ntb);
+	peer_port = ntb_peer_logical_port_number(ntb, pidx);
+
+	if (peer_port < local_port)
+		return local_port - 1;
+	else
+		return local_port;
+}
+
+/**
+ * ntb_peer_highest_mw_idx() - get a memory window index for a given peer idx
+ *	using the highest index memory windows first
+ *
+ * @ntb:	NTB device context.
+ * @pidx:	Peer port index.
+ *
+ * Like ntb_peer_resource_idx(), except it returns indexes starting with
+ * last memory window index.
+ *
+ * Return: the resource index to use for that peer.
+ */
+static inline int ntb_peer_highest_mw_idx(struct ntb_dev *ntb, int pidx)
+{
+	int ret;
+
+	ret = ntb_peer_resource_idx(ntb, pidx);
+	if (ret < 0)
+		return ret;
+
+	return ntb_mw_count(ntb, pidx) - ret - 1;
+}
+
 #endif
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
