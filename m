Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A6D159511
	for <lists.iommu@lfdr.de>; Tue, 11 Feb 2020 17:36:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B175486DAF;
	Tue, 11 Feb 2020 16:36:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pgohrACMLKSL; Tue, 11 Feb 2020 16:36:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6E18486DAE;
	Tue, 11 Feb 2020 16:36:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57380C07FE;
	Tue, 11 Feb 2020 16:36:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F090C07FE
 for <iommu@lists.linux-foundation.org>; Tue, 11 Feb 2020 16:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 28C50204F4
 for <iommu@lists.linux-foundation.org>; Tue, 11 Feb 2020 16:36:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vlnPlFZONWK5 for <iommu@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 16:36:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id 6EBE2204EC
 for <iommu@lists.linux-foundation.org>; Tue, 11 Feb 2020 16:36:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9A6030E;
 Tue, 11 Feb 2020 08:36:38 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14FF13F68E;
 Tue, 11 Feb 2020 08:36:37 -0800 (PST)
Subject: Re: AMD IOMMU stops RDMA NFS from working since kernel 5.5 (bisected)
To: Chuck Lever <chuck.lever@oracle.com>, Andre Tomt <andre@tomt.net>
References: <7ee099af-e6bb-18fe-eb93-2a8abd401570@tomt.net>
 <20200211072537.GD23114@suse.de>
 <2CE039F4-3519-4481-B0E2-840D24EE4428@oracle.com>
 <ac758665-9127-9a52-4f03-49fecc5289a2@arm.com>
 <3507674A-F860-4B65-BD46-93431DD268AC@oracle.com>
 <21c801a6-9a8b-1ebb-7e41-76e8385116ea@arm.com>
 <A411A8A6-ECEF-4EAD-84A1-99A30A213D8E@oracle.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <35961bac-2f1e-3fbc-9661-031b9d5acee3@arm.com>
Date: Tue, 11 Feb 2020 16:36:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <A411A8A6-ECEF-4EAD-84A1-99A30A213D8E@oracle.com>
Content-Language: en-GB
Cc: Tom Murphy <tmurphy@arista.com>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 Joerg Roedel <jroedel@suse.de>, iommu@lists.linux-foundation.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 11/02/2020 4:03 pm, Chuck Lever wrote:
> 
> 
>> On Feb 11, 2020, at 10:32 AM, Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> On 11/02/2020 3:24 pm, Chuck Lever wrote:
>>>> On Feb 11, 2020, at 10:12 AM, Robin Murphy <robin.murphy@arm.com> wrote:
>>>>
>>>> On 11/02/2020 1:48 pm, Chuck Lever wrote:
>>>>> Andre-
>>>>> Thank you for the detailed report!
>>>>> Tom-
>>>>> There is a rich set of trace points available in the RPC/RDMA implementation in 5.4/5.5, fwiw.
>>>>> Please keep me in the loop, let me know if there is anything I can do to help.
>>>>
>>>> One aspect that may be worth checking is whether there's anywhere that assumes a successful return value from dma_map_sg() is always the same as the number of entries passed in - that's the most obvious way the iommu-dma code differs (legitimately) from the previous amd-iommu implementation.
>>> net/sunrpc/xprtrdma/frwr_ops.c: frwr_map()
>>> 317         mr->mr_nents =
>>> 318                 ib_dma_map_sg(ia->ri_id->device, mr->mr_sg, i, mr->mr_dir);
>>> 319         if (!mr->mr_nents)
>>> 320                 goto out_dmamap_err;
>>> Should that rather be "if (mr->mr_nents != i)" ?
>>
>> No, that much is OK - the point is that dma_map_sg() may pack the DMA addresses such that sg_dma_len(sg) > sg->length - however, subsequently passing that mr->nents to dma_unmap_sg() in frwr_mr_recycle() (rather than the original value of i) looks at a glance like an example of how things may start to get out-of-whack.
> 
> Robin, your explanation makes sense to me. I can post a fix for this imbalance later today for Andre to try.

FWIW here's a quick hack which *should* suppress the concatenation 
behaviour - if it makes Andre's system any happier then that would 
indeed point towards dma_map_sg() handling being the culprit.

Robin.

----->8-----
diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index a2e96a5fd9a7..a6b71bad518e 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -779,7 +779,7 @@ static int __finalise_sg(struct device *dev, struct 
scatterlist *sg, int nents,
  		 * - but doesn't fall at a segment boundary
  		 * - and wouldn't make the resulting output segment too long
  		 */
-		if (cur_len && !s_iova_off && (dma_addr & seg_mask) &&
+		if (0 && cur_len && !s_iova_off && (dma_addr & seg_mask) &&
  		    (max_len - cur_len >= s_length)) {
  			/* ...then concatenate it with the previous one */
  			cur_len += s_length;
@@ -799,6 +799,7 @@ static int __finalise_sg(struct device *dev, struct 
scatterlist *sg, int nents,
  		if (s_length + s_iova_off < s_iova_len)
  			cur_len = 0;
  	}
+	WARN_ON(count < nents);
  	return count;
  }

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
