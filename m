Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0773B4CD65E
	for <lists.iommu@lfdr.de>; Fri,  4 Mar 2022 15:29:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 830D54023F;
	Fri,  4 Mar 2022 14:29:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Iv4GGaJ2_lF0; Fri,  4 Mar 2022 14:29:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 17E5A409E5;
	Fri,  4 Mar 2022 14:29:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2E87C000B;
	Fri,  4 Mar 2022 14:29:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D63FC000B
 for <iommu@lists.linux-foundation.org>; Fri,  4 Mar 2022 14:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F527409FF
 for <iommu@lists.linux-foundation.org>; Fri,  4 Mar 2022 14:29:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kroah.com header.b="N+2jGOBs";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="jxsMnJdH"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OFi7_NEHvXMe for <iommu@lists.linux-foundation.org>;
 Fri,  4 Mar 2022 14:29:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D3A6409F5
 for <iommu@lists.linux-foundation.org>; Fri,  4 Mar 2022 14:29:01 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6192358050E;
 Fri,  4 Mar 2022 09:28:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 04 Mar 2022 09:28:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=UK9vkuMHfT6LnlApSa4x+a66PQwwwcr7oPki2j
 NRUl0=; b=N+2jGOBsXN0LXBB6xpsLSwG5wEZEcvyzL7pZEiazTL/puLHXyFartJ
 wY2GgQwA246+Rm2Z9M0bpUIVvZLPLqwIphTydqjpp3wRzejaJibmv0KbtTidXrlm
 NyqNW81owC1QIHdyNAGmgs985wRWLozVp4hKzcRfblUywWbneKLIJncESUQ3aeCm
 Ri+sBzHqiGo9RgSTRGO75Gxd+FyvXT4TCwuz7F7QDePJmMoaEgqzY+ty93BjbreF
 zg9LQMAmoAsKTDgpfXYX4omprPYsTD8/d4LWgQi9kNMCxCJrbIJoDzQVZIeJ1Y5f
 DjzSGBxz8aKs/mBPo0PT15GaMA9XnzVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=UK9vkuMHfT6LnlApS
 a4x+a66PQwwwcr7oPki2jNRUl0=; b=jxsMnJdHvoEDIWm72z0o3JNNsD2R2drEF
 t5AQLHbz3jkHG9yjJrExlW5zXOqu1HpJkFD7W2nEaUa8RJIq4+etetIdbfPlrUFY
 4zYQzE2d1X2QejX/1EnbbpFsg22TkRJ6TEdadWwCBjgaHFmK9eNSgmM2uDVu8Env
 SkUffrQ6yPJXDpfwQeD8zlNZZyIm6iA1C65j0K9Y48VazaAodXvJoK/PDQqa2o0x
 c4ldf55xo5aAcLPa/kpqKzx7djUyDhbJnvTSKgRaaRGA4f/RDvpG8ltPAo0tlDuF
 +vyj9Mf+rPuUIYuz2GLisFfVl1ycXon7gbenDMRbeQzym+2e01bcg==
X-ME-Sender: <xms:JiIiYpVNpGU1syshHadKzxKQBGoWD-MALEZQkvO2v0gpANnCKF_2Wg>
 <xme:JiIiYpkC--e_SyPbdxtPj8-AFU_1F6oi8DfG1X0eoKhrIBQJ0CML62wNSVlao7Ewg
 JnJW3v7AVLRSQ>
X-ME-Received: <xmr:JiIiYlbpoVQCgpXtrfV57St-5LuaBX2zMLy3Z76ldq8k8GBU91U6VdUzA7XAKDPqNzlzdCiqj50dEQKNKjzQvuc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtkedgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeeuleeltd
 ehkeeltefhleduuddvhfffuedvffduveegheekgeeiffevheegfeetgfenucffohhmrghi
 nhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:JiIiYsUJv3QSdXgD6l7R5N5gzBfx3362HvVTTR-cxnC4cyYBbECwAA>
 <xmx:JiIiYjnr_WtejZ7tuFlxKzYT-Lpwal5SndpiBRVWO_8m1-JPoXLH0Q>
 <xmx:JiIiYpf55OOf3rbqytIPo4xQtS4SJ6UhiNnpDfFL_sHGev5yisz45A>
 <xmx:JyIiYmES6l-MuAH030JMSuAW09JHHFg0PcZDL9AVLl9Ct1XcaMlSWA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Mar 2022 09:28:54 -0500 (EST)
Date: Fri, 4 Mar 2022 15:28:52 +0100
From: Greg KH <greg@kroah.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 2/2] swiotlb: fix info leak with DMA_FROM_DEVICE
Message-ID: <YiIiJGVmQgqne22R@kroah.com>
References: <20220304135859.3521513-1-pasic@linux.ibm.com>
 <20220304135859.3521513-3-pasic@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220304135859.3521513-3-pasic@linux.ibm.com>
Cc: Ali Haider <ali.haider@ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-doc@vger.kernel.org,
 stable@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, Doug Gilbert <dgilbert@interlog.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
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

On Fri, Mar 04, 2022 at 02:58:59PM +0100, Halil Pasic wrote:
> The problem I'm addressing was discovered by the LTP test covering
> cve-2018-1000204.
> 
> A short description of what happens follows:
> 1) The test case issues a command code 00 (TEST UNIT READY) via the SG_IO
>    interface with: dxfer_len == 524288, dxdfer_dir == SG_DXFER_FROM_DEV
>    and a corresponding dxferp. The peculiar thing about this is that TUR
>    is not reading from the device.
> 2) In sg_start_req() the invocation of blk_rq_map_user() effectively
>    bounces the user-space buffer. As if the device was to transfer into
>    it. Since commit a45b599ad808 ("scsi: sg: allocate with __GFP_ZERO in
>    sg_build_indirect()") we make sure this first bounce buffer is
>    allocated with GFP_ZERO.
> 3) For the rest of the story we keep ignoring that we have a TUR, so the
>    device won't touch the buffer we prepare as if the we had a
>    DMA_FROM_DEVICE type of situation. My setup uses a virtio-scsi device
>    and the  buffer allocated by SG is mapped by the function
>    virtqueue_add_split() which uses DMA_FROM_DEVICE for the "in" sgs (here
>    scatter-gather and not scsi generics). This mapping involves bouncing
>    via the swiotlb (we need swiotlb to do virtio in protected guest like
>    s390 Secure Execution, or AMD SEV).
> 4) When the SCSI TUR is done, we first copy back the content of the second
>    (that is swiotlb) bounce buffer (which most likely contains some
>    previous IO data), to the first bounce buffer, which contains all
>    zeros.  Then we copy back the content of the first bounce buffer to
>    the user-space buffer.
> 5) The test case detects that the buffer, which it zero-initialized,
>   ain't all zeros and fails.
> 
> This is an swiotlb problem, because the swiotlb should be transparent in
> a sense that it does not affect the outcome (if all other participants
> are well behaved), and without swiotlb we leak all zeros.  Even if
> swiotlb_tbl_map_single() zero-initialised the allocated slot(s) to avoid
> leaking stale data back to the caller later, when it comes to unmap or
> sync_for_cpu it still fundamentally cannot tell how much of the contents
> of the bounce slot have actually changed, therefore if the caller was
> expecting the device to do a partial write, the rest of the mapped
> buffer *will* be corrupted by bouncing the whole thing back again.
> 
> Copying the content of the original buffer into the swiotlb buffer is
> the only way I can think of to make swiotlb transparent in such
> scenarios. So let's do just that.
> 
> The extra bounce is expected to hurt the performance. For the cases
> where the extra bounce is not necessary we could get rid of it, if we
> were told by the client code, that it is not needed. Such optimisations
> are out of scope for this patch, and are likely to be a subject of some
> future work.
> 
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> Reported-by: Ali Haider <ali.haider@ibm.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  kernel/dma/swiotlb.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
