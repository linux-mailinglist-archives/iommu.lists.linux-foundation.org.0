Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C4931138980
	for <lists.iommu@lfdr.de>; Mon, 13 Jan 2020 03:38:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9176D848F4;
	Mon, 13 Jan 2020 02:38:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GCg9oZ7wJAyR; Mon, 13 Jan 2020 02:38:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 89ABA847AB;
	Mon, 13 Jan 2020 02:38:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 740D4C1D8D;
	Mon, 13 Jan 2020 02:38:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 645C0C077D
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jan 2020 02:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4CA9E20130
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jan 2020 02:38:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a00VLp4xsJVy for <iommu@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 02:38:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by silver.osuosl.org (Postfix) with ESMTPS id 8FB3520033
 for <iommu@lists.linux-foundation.org>; Mon, 13 Jan 2020 02:38:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jan 2020 18:38:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,427,1571727600"; d="scan'208";a="247581010"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
 ([10.239.159.136])
 by fmsmga004.fm.intel.com with ESMTP; 12 Jan 2020 18:38:30 -0800
Subject: Re: Regression iommu/vt-d bounce buffer
To: Joerg Roedel <joro@8bytes.org>
References: <fe41dfaa-e899-0d6c-69e4-0379be376c09@linux.com>
 <20200110162831.GC28359@8bytes.org>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <687b679b-76c7-15b0-1399-098e0afb3267@linux.intel.com>
Date: Mon, 13 Jan 2020 10:37:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200110162831.GC28359@8bytes.org>
Content-Language: en-US
Cc: Frederik Schwan <frederik.schwan@linux.com>,
 David Woodhouse <dwmw2@infradead.org>, iommu@lists.linux-foundation.org
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

Hi Joerg,

On 1/11/20 12:28 AM, Joerg Roedel wrote:
> Hi Baolu,
> 
> any ideas here?

I am looking at this issue.

Best regards,
baolu

> 
> On Mon, Jan 06, 2020 at 04:43:05PM +0100, Frederik Schwan wrote:
>> Hello people,
>> since the introduction of the bounce buffer, a regression with TB3 devices has been introduced.
>> USB devices attached to TB3 refuse to work since. Removing the commits that introduced the bounce buffer, fixes the issue.
>>
>> Commits:
>> 3b53034c268d550d9e8522e613a14ab53b8840d8
>> c5a5dc4cbbf4540c1891cdb2b70cf469405ea61f
>> cfb94a372f2d4ee226247447c863f8709863d170
>> e5e04d051979dbd636a99099b7a595093c50a4bc
>>
>>
>> An excerpt of the trace:
>>> [  +0,000005] WARNING: CPU: 10 PID: 0 at drivers/iommu/intel-iommu.c:3916 bounce_unmap_single+0x103/0x110
>>> [...]
>>> [  +0,000001] Call Trace:
>>> [  +0,000002]  <IRQ>
>>> [  +0,000003]  usb_hcd_unmap_urb_setup_for_dma+0x9f/0xe0
>>> [  +0,000001]  usb_hcd_unmap_urb_for_dma+0x1c/0x170
>>> [  +0,000002]  __usb_hcd_giveback_urb+0x36/0x120
>>> [  +0,000008]  xhci_giveback_urb_in_irq.isra.0+0x72/0x100 [xhci_hcd]
>>> [  +0,000007]  xhci_td_cleanup+0x101/0x140 [xhci_hcd]
>>> [  +0,000007]  xhci_irq+0xbf0/0x1db0 [xhci_hcd]
>>> [  +0,000005]  __handle_irq_event_percpu+0x44/0x1b0
>>> [  +0,000002]  handle_irq_event_percpu+0x34/0x80
>>> [  +0,000002]  handle_irq_event+0x37/0x54
>>> [  +0,000002]  handle_edge_irq+0xae/0x1f0
>>> [  +0,000002]  do_IRQ+0x84/0x140
>>> [  +0,000003]  common_interrupt+0xf/0xf
>>> [  +0,000001]  </IRQ>
>>
>> Dmesg log and further information have been posted here: https://bugzilla.kernel.org/show_bug.cgi?id=205893
>>
>> Cheers,
>> Frederik
>>
> 
> 
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
