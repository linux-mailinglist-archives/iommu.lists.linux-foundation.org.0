Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0EC2FDDC
	for <lists.iommu@lfdr.de>; Thu, 30 May 2019 16:32:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9F7DC3BE6;
	Thu, 30 May 2019 14:32:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5FF433BA4
	for <iommu@lists.linux-foundation.org>;
	Thu, 30 May 2019 14:19:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9BEF76C5
	for <iommu@lists.linux-foundation.org>;
	Thu, 30 May 2019 14:19:58 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 45B6F2005FF;
	Thu, 30 May 2019 16:19:57 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
	[134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 380D12002A0;
	Thu, 30 May 2019 16:19:57 +0200 (CEST)
Received: from fsr-ub1864-101.ea.freescale.net
	(fsr-ub1864-101.ea.freescale.net [10.171.82.13])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id A3E7F2062D;
	Thu, 30 May 2019 16:19:56 +0200 (CEST)
From: laurentiu.tudor@nxp.com
To: netdev@vger.kernel.org, madalin.bucur@nxp.com, roy.pledge@nxp.com,
	camelia.groza@nxp.com, leoyang.li@nxp.com
Subject: [PATCH v3 6/6] dpaa_eth: fix iova handling for sg frames
Date: Thu, 30 May 2019 17:19:51 +0300
Message-Id: <20190530141951.6704-7-laurentiu.tudor@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190530141951.6704-1-laurentiu.tudor@nxp.com>
References: <20190530141951.6704-1-laurentiu.tudor@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-kernel@vger.kernel.org, Joakim.Tjernlund@infinera.com,
	iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
	davem@davemloft.net, linux-arm-kernel@lists.infradead.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

From: Laurentiu Tudor <laurentiu.tudor@nxp.com>

The driver relies on the no longer valid assumption that dma addresses
(iovas) are identical to physical addressees and uses phys_to_virt() to
make iova -> vaddr conversions. Fix this also for scatter-gather frames
using the iova -> phys conversion function added in the previous patch.
While at it, clean-up a redundant dpaa_bpid2pool() and pass the bp
as parameter.

Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Acked-by: Madalin Bucur <madalin.bucur@nxp.com>
---
 .../net/ethernet/freescale/dpaa/dpaa_eth.c    | 40 +++++++++++--------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
index 46194a04617a..7d978a93dffd 100644
--- a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
@@ -1641,14 +1641,17 @@ static struct sk_buff *dpaa_cleanup_tx_fd(const struct dpaa_priv *priv,
 
 	if (unlikely(qm_fd_get_format(fd) == qm_fd_sg)) {
 		nr_frags = skb_shinfo(skb)->nr_frags;
-		dma_unmap_single(dev, addr,
-				 qm_fd_get_offset(fd) + DPAA_SGT_SIZE,
-				 dma_dir);
 
 		/* The sgt buffer has been allocated with netdev_alloc_frag(),
 		 * it's from lowmem.
 		 */
-		sgt = phys_to_virt(addr + qm_fd_get_offset(fd));
+		sgt = phys_to_virt(dpaa_iova_to_phys(priv,
+						     addr +
+						     qm_fd_get_offset(fd)));
+
+		dma_unmap_single(dev, addr,
+				 qm_fd_get_offset(fd) + DPAA_SGT_SIZE,
+				 dma_dir);
 
 		/* sgt[0] is from lowmem, was dma_map_single()-ed */
 		dma_unmap_single(dev, qm_sg_addr(&sgt[0]),
@@ -1663,7 +1666,7 @@ static struct sk_buff *dpaa_cleanup_tx_fd(const struct dpaa_priv *priv,
 		}
 
 		/* Free the page frag that we allocated on Tx */
-		skb_free_frag(phys_to_virt(addr));
+		skb_free_frag(skbh);
 	} else {
 		dma_unmap_single(dev, addr,
 				 skb_tail_pointer(skb) - (u8 *)skbh, dma_dir);
@@ -1724,14 +1727,14 @@ static struct sk_buff *contig_fd_to_skb(const struct dpaa_priv *priv,
  * The page fragment holding the S/G Table is recycled here.
  */
 static struct sk_buff *sg_fd_to_skb(const struct dpaa_priv *priv,
-				    const struct qm_fd *fd)
+				    const struct qm_fd *fd,
+				    struct dpaa_bp *dpaa_bp,
+				    void *vaddr)
 {
 	ssize_t fd_off = qm_fd_get_offset(fd);
-	dma_addr_t addr = qm_fd_addr(fd);
 	const struct qm_sg_entry *sgt;
 	struct page *page, *head_page;
-	struct dpaa_bp *dpaa_bp;
-	void *vaddr, *sg_vaddr;
+	void *sg_vaddr;
 	int frag_off, frag_len;
 	struct sk_buff *skb;
 	dma_addr_t sg_addr;
@@ -1740,7 +1743,6 @@ static struct sk_buff *sg_fd_to_skb(const struct dpaa_priv *priv,
 	int *count_ptr;
 	int i;
 
-	vaddr = phys_to_virt(addr);
 	WARN_ON(!IS_ALIGNED((unsigned long)vaddr, SMP_CACHE_BYTES));
 
 	/* Iterate through the SGT entries and add data buffers to the skb */
@@ -1751,14 +1753,17 @@ static struct sk_buff *sg_fd_to_skb(const struct dpaa_priv *priv,
 		WARN_ON(qm_sg_entry_is_ext(&sgt[i]));
 
 		sg_addr = qm_sg_addr(&sgt[i]);
-		sg_vaddr = phys_to_virt(sg_addr);
-		WARN_ON(!IS_ALIGNED((unsigned long)sg_vaddr,
-				    SMP_CACHE_BYTES));
 
 		/* We may use multiple Rx pools */
 		dpaa_bp = dpaa_bpid2pool(sgt[i].bpid);
-		if (!dpaa_bp)
+		if (!dpaa_bp) {
+			pr_info("%s: fail to get dpaa_bp for sg bpid %d\n",
+				__func__, sgt[i].bpid);
 			goto free_buffers;
+		}
+		sg_vaddr = phys_to_virt(dpaa_iova_to_phys(priv, sg_addr));
+		WARN_ON(!IS_ALIGNED((unsigned long)sg_vaddr,
+				    SMP_CACHE_BYTES));
 
 		count_ptr = this_cpu_ptr(dpaa_bp->percpu_count);
 		dma_unmap_single(dpaa_bp->dev, sg_addr, dpaa_bp->size,
@@ -1830,10 +1835,11 @@ static struct sk_buff *sg_fd_to_skb(const struct dpaa_priv *priv,
 	/* free all the SG entries */
 	for (i = 0; i < DPAA_SGT_MAX_ENTRIES ; i++) {
 		sg_addr = qm_sg_addr(&sgt[i]);
-		sg_vaddr = phys_to_virt(sg_addr);
-		skb_free_frag(sg_vaddr);
 		dpaa_bp = dpaa_bpid2pool(sgt[i].bpid);
 		if (dpaa_bp) {
+			sg_addr = dpaa_iova_to_phys(priv, sg_addr);
+			sg_vaddr = phys_to_virt(sg_addr);
+			skb_free_frag(sg_vaddr);
 			count_ptr = this_cpu_ptr(dpaa_bp->percpu_count);
 			(*count_ptr)--;
 		}
@@ -2326,7 +2332,7 @@ static enum qman_cb_dqrr_result rx_default_dqrr(struct qman_portal *portal,
 	if (likely(fd_format == qm_fd_contig))
 		skb = contig_fd_to_skb(priv, fd, dpaa_bp, vaddr);
 	else
-		skb = sg_fd_to_skb(priv, fd);
+		skb = sg_fd_to_skb(priv, fd, dpaa_bp, vaddr);
 	if (!skb)
 		return qman_cb_dqrr_consume;
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
