Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A8C553E36
	for <lists.iommu@lfdr.de>; Tue, 21 Jun 2022 23:57:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E587041B89;
	Tue, 21 Jun 2022 21:57:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E587041B89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gWiLePf5TOpM; Tue, 21 Jun 2022 21:57:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 535E0408BE;
	Tue, 21 Jun 2022 21:57:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 535E0408BE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1024EC0081;
	Tue, 21 Jun 2022 21:57:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE9E6C002D
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jun 2022 21:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3F6B60ED8
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jun 2022 21:57:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3F6B60ED8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D9xhURAM9XVn for <iommu@lists.linux-foundation.org>;
 Tue, 21 Jun 2022 21:57:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEEF960A82
Received: from mailout.easymail.ca (mailout.easymail.ca [64.68.200.34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CEEF960A82
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jun 2022 21:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mailout.easymail.ca (Postfix) with ESMTP id C97F261DF6;
 Tue, 21 Jun 2022 21:56:59 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at emo09-pco.easydns.vpn
Received: from mailout.easymail.ca ([127.0.0.1])
 by localhost (emo09-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FLc2uL2Ic0RZ; Tue, 21 Jun 2022 21:56:59 +0000 (UTC)
Received: from mail.gonehiking.org (unknown [38.15.45.1])
 by mailout.easymail.ca (Postfix) with ESMTPA id 45ED161DF5;
 Tue, 21 Jun 2022 21:56:59 +0000 (UTC)
Received: from [192.168.1.4] (internal [192.168.1.4])
 by mail.gonehiking.org (Postfix) with ESMTP id C716D3EF14;
 Tue, 21 Jun 2022 15:56:58 -0600 (MDT)
Message-ID: <7a6df2da-95e8-b2fd-7565-e4b7a51c5b63@gonehiking.org>
Date: Tue, 21 Jun 2022 15:56:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/3] scsi: BusLogic remove bus_to_virt
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-3-arnd@kernel.org>
From: Khalid Aziz <khalid@gonehiking.org>
In-Reply-To: <20220617125750.728590-3-arnd@kernel.org>
Cc: linux-arch@vger.kernel.org, Miquel van Smoorenburg <mikevs@xs4all.net>,
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linuxppc-dev@lists.ozlabs.org, linux-m68k@lists.linux-m68k.org,
 Denis Efremov <efremov@linux.com>, Mark Salyzyn <salyzyn@android.com>,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 Matt Wang <wwentao@vmware.com>, linux-alpha@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>,
 Robin Murphy <robin.murphy@arm.com>
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
Reply-To: khalid@gonehiking.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 6/17/22 06:57, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The BusLogic driver is the last remaining driver that relies on the
> deprecated bus_to_virt() function, which in turn only works on a few
> architectures, and is incompatible with both swiotlb and iommu support.
> 
> Before commit 391e2f25601e ("[SCSI] BusLogic: Port driver to 64-bit."),
> the driver had a dependency on x86-32, presumably because of this
> problem. However, the change introduced another bug that made it still
> impossible to use the driver on any 64-bit machine.
> 
> This was in turn fixed in commit 56f396146af2 ("scsi: BusLogic: Fix
> 64-bit system enumeration error for Buslogic"), 8 years later, which
> shows that there are not a lot of users.
> 
> Maciej is still using the driver on 32-bit hardware, and Khalid mentioned
> that the driver works with the device emulation used in VirtualBox
> and VMware. Both of those only emulate it for Windows 2000 and older
> operating systems that did not ship with the better LSI logic driver.
> 
> Do a minimum fix that searches through the list of descriptors to find
> one that matches the bus address. This is clearly as inefficient as
> was indicated in the code comment about the lack of a bus_to_virt()
> replacement. A better fix would likely involve changing out the entire
> descriptor allocation for a simpler one, but that would be much
> more invasive.
> 
> Cc: Maciej W. Rozycki <macro@orcam.me.uk>
> Cc: Matt Wang <wwentao@vmware.com>
> Cc: Khalid Aziz <khalid@gonehiking.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/scsi/BusLogic.c | 27 ++++++++++++++++-----------
>   drivers/scsi/Kconfig    |  2 +-
>   2 files changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/scsi/BusLogic.c b/drivers/scsi/BusLogic.c
> index a897c8f914cf..d057abfcdd5c 100644
> --- a/drivers/scsi/BusLogic.c
> +++ b/drivers/scsi/BusLogic.c
> @@ -2515,12 +2515,26 @@ static int blogic_resultcode(struct blogic_adapter *adapter,
>   	return (hoststatus << 16) | tgt_status;
>   }
>   
> +/*
> + * turn the dma address from an inbox into a ccb pointer
> + * This is rather inefficient.
> + */
> +static struct blogic_ccb *
> +blogic_inbox_to_ccb(struct blogic_adapter *adapter, struct blogic_inbox *inbox)
> +{
> +	struct blogic_ccb *ccb;
> +
> +	for (ccb = adapter->all_ccbs; ccb; ccb = ccb->next_all)
> +		if (inbox->ccb == ccb->dma_handle)
> +			break;
> +
> +	return ccb;
> +}
>   
>   /*
>     blogic_scan_inbox scans the Incoming Mailboxes saving any
>     Incoming Mailbox entries for completion processing.
>   */
> -
>   static void blogic_scan_inbox(struct blogic_adapter *adapter)
>   {
>   	/*
> @@ -2540,16 +2554,7 @@ static void blogic_scan_inbox(struct blogic_adapter *adapter)
>   	enum blogic_cmplt_code comp_code;
>   
>   	while ((comp_code = next_inbox->comp_code) != BLOGIC_INBOX_FREE) {
> -		/*
> -		   We are only allowed to do this because we limit our
> -		   architectures we run on to machines where bus_to_virt(
> -		   actually works.  There *needs* to be a dma_addr_to_virt()
> -		   in the new PCI DMA mapping interface to replace
> -		   bus_to_virt() or else this code is going to become very
> -		   innefficient.
> -		 */
> -		struct blogic_ccb *ccb =
> -			(struct blogic_ccb *) bus_to_virt(next_inbox->ccb);
> +		struct blogic_ccb *ccb = blogic_inbox_to_ccb(adapter, adapter->next_inbox);

This change looks good enough as workaround to not use bus_to_virt() for 
now. There are two problems I see though. One, I do worry about 
blogic_inbox_to_ccb() returning NULL for ccb which should not happen 
unless the mailbox pointer was corrupted which would indicate a bigger 
problem. Nevertheless a NULL pointer causing kernel panic concerns me. 
How about adding a check before we dereference ccb?

Second, with this patch applied, I am seeing errors from the driver:

=====================
[ 1623.902685]  sdb: sdb1 sdb2
[ 1623.903245] sd 2:0:0:0: [sdb] Attached SCSI disk
[ 1623.911000] scsi2: Illegal CCB #76 status 2 in Incoming Mailbox
[ 1623.911005] scsi2: Illegal CCB #76 status 2 in Incoming Mailbox
[ 1623.911070] scsi2: Illegal CCB #79 status 2 in Incoming Mailbox
[ 1651.458008] scsi2: Warning: Partition Table appears to have Geometry 
256/63 which is
[ 1651.458013] scsi2: not compatible with current BusLogic Host Adapter 
Geometry 255/63
[ 1658.797609] scsi2: Resetting BusLogic BT-958D Failed
[ 1659.533208] sd 2:0:0:0: Device offlined - not ready after error recovery
[ 1659.533331] sd 2:0:0:0: Device offlined - not ready after error recovery
[ 1659.533333] sd 2:0:0:0: Device offlined - not ready after error recovery
[ 1659.533342] sd 2:0:0:0: [sdb] tag#101 FAILED Result: 
hostbyte=DID_TIME_OUT driverbyte=DRIVER_OK cmd_age=35s
[ 1659.533345] sd 2:0:0:0: [sdb] tag#101 CDB: Read(10) 28 00 00 00 00 28 
00 00 10 00
[ 1659.533346] I/O error, dev sdb, sector 40 op 0x0:(READ) flags 0x80700 
phys_seg 1 prio class 0

=================

This is on VirtualBox using emulated BusLogic adapter.

This patch needs more refinement.

Thanks,
Khalid



>   		if (comp_code != BLOGIC_Cn erroneousMD_NOTFOUND) {
>   			if (ccb->status == BLOGIC_CCB_ACTIVE ||
>   					ccb->status == BLOGIC_CCB_RESET) {
> diff --git a/drivers/scsi/Kconfig b/drivers/scsi/Kconfig
> index cf75588a2587..56bdc08d0b77 100644
> --- a/drivers/scsi/Kconfig
> +++ b/drivers/scsi/Kconfig
> @@ -513,7 +513,7 @@ config SCSI_HPTIOP
>   
>   config SCSI_BUSLOGIC
>   	tristate "BusLogic SCSI support"
> -	depends on PCI && SCSI && VIRT_TO_BUS
> +	depends on PCI && SCSI
>   	help
>   	  This is support for BusLogic MultiMaster and FlashPoint SCSI Host
>   	  Adapters. Consult the SCSI-HOWTO, available from

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
