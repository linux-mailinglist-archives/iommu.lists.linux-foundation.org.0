Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5A94E674A
	for <lists.iommu@lfdr.de>; Thu, 24 Mar 2022 17:52:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4CE961011;
	Thu, 24 Mar 2022 16:52:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jr24Kf6LuBt5; Thu, 24 Mar 2022 16:52:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C4EF160FEB;
	Thu, 24 Mar 2022 16:52:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8984EC0082;
	Thu, 24 Mar 2022 16:52:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E8BDC000B
 for <iommu@lists.linux-foundation.org>; Thu, 24 Mar 2022 16:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2ECC884472
 for <iommu@lists.linux-foundation.org>; Thu, 24 Mar 2022 16:52:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mkpbn5fsFlnW for <iommu@lists.linux-foundation.org>;
 Thu, 24 Mar 2022 16:52:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1479384470
 for <iommu@lists.linux-foundation.org>; Thu, 24 Mar 2022 16:52:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39B06D6E;
 Thu, 24 Mar 2022 09:52:38 -0700 (PDT)
Received: from [10.57.41.19] (unknown [10.57.41.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D3993F73B;
 Thu, 24 Mar 2022 09:52:35 -0700 (PDT)
Message-ID: <d8a1cbf4-a521-78ec-1560-28d855e0913e@arm.com>
Date: Thu, 24 Mar 2022 16:52:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [REGRESSION] Recent swiotlb DMA_FROM_DEVICE fixes break
 ath9k-based AP
Content-Language: en-GB
To: Christoph Hellwig <hch@lst.de>, Maxime Bizon <mbizon@freebox.fr>
References: <1812355.tdWV9SEqCh@natalenko.name>
 <f88ca616-96d1-82dc-1bc8-b17480e937dd@arm.com>
 <20220324055732.GB12078@lst.de> <4386660.LvFx2qVVIh@natalenko.name>
 <81ffc753-72aa-6327-b87b-3f11915f2549@arm.com> <878rsza0ih.fsf@toke.dk>
 <4be26f5d8725cdb016c6fdd9d05cfeb69cdd9e09.camel@freebox.fr>
 <20220324163132.GB26098@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220324163132.GB26098@lst.de>
Cc: =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@toke.dk>,
 Netdev <netdev@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 stable <stable@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, iommu <iommu@lists.linux-foundation.org>,
 Olha Cherevyk <olha.cherevyk@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
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

On 2022-03-24 16:31, Christoph Hellwig wrote:
> On Thu, Mar 24, 2022 at 05:29:12PM +0100, Maxime Bizon wrote:
>>> I'm looking into this; but in the interest of a speedy resolution of
>>> the regression I would be in favour of merging that partial revert
>>> and reinstating it if/when we identify (and fix) any bugs in ath9k :)
>>
>> This looks fishy:
>>
>> ath9k/recv.c
>>
>>                  /* We will now give hardware our shiny new allocated skb */
>>                  new_buf_addr = dma_map_single(sc->dev, requeue_skb->data,
>>                                                common->rx_bufsize, dma_type);
>>                  if (unlikely(dma_mapping_error(sc->dev, new_buf_addr))) {
>>                          dev_kfree_skb_any(requeue_skb);
>>                          goto requeue_drop_frag;
>>                  }
>>
>>                  /* Unmap the frame */
>>                  dma_unmap_single(sc->dev, bf->bf_buf_addr,
>>                                   common->rx_bufsize, dma_type);
>>
>>                  bf->bf_mpdu = requeue_skb;
>>                  bf->bf_buf_addr = new_buf_addr;
> 
> Creating a new mapping for the same buffer before unmapping the
> previous one does looks rather bogus.  But it does not fit the
> pattern where revering the sync_single changes make the driver
> work again.

OK, you made me look :)

Now that it's obvious what to look for, I can only conclude that during 
the stanza in ath_edma_get_buffers(), the device is still writing to the 
buffer while ownership has been transferred to the CPU, and whatever got 
written while ath9k_hw_process_rxdesc_edma() was running then gets wiped 
out by the subsequent sync_for_device, which currently resets the 
SWIOTLB slot to the state that sync_for_cpu copied out. By the letter of 
the DMA API that's not allowed, but on the other hand I'm not sure if we 
even have a good idiom for "I can't tell if the device has finished with 
this buffer or not unless I look at it" :/

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
