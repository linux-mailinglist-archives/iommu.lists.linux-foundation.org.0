Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4C313739B
	for <lists.iommu@lfdr.de>; Fri, 10 Jan 2020 17:28:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6D3C6203F7;
	Fri, 10 Jan 2020 16:28:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g293hnfXZbpU; Fri, 10 Jan 2020 16:28:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D683E204DA;
	Fri, 10 Jan 2020 16:28:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE353C0881;
	Fri, 10 Jan 2020 16:28:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7DA1C0881
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jan 2020 16:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BEFEA869C7
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jan 2020 16:28:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 87eM0T7oIvgx for <iommu@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 16:28:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 32C59869B4
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jan 2020 16:28:39 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 71D0C546; Fri, 10 Jan 2020 17:28:34 +0100 (CET)
Date: Fri, 10 Jan 2020 17:28:32 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: Regression iommu/vt-d bounce buffer
Message-ID: <20200110162831.GC28359@8bytes.org>
References: <fe41dfaa-e899-0d6c-69e4-0379be376c09@linux.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fe41dfaa-e899-0d6c-69e4-0379be376c09@linux.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Baolu,

any ideas here?

On Mon, Jan 06, 2020 at 04:43:05PM +0100, Frederik Schwan wrote:
> Hello people,
> since the introduction of the bounce buffer, a regression with TB3 devices has been introduced.
> USB devices attached to TB3 refuse to work since. Removing the commits that introduced the bounce buffer, fixes the issue.
> 
> Commits:
> 3b53034c268d550d9e8522e613a14ab53b8840d8
> c5a5dc4cbbf4540c1891cdb2b70cf469405ea61f
> cfb94a372f2d4ee226247447c863f8709863d170
> e5e04d051979dbd636a99099b7a595093c50a4bc
> 
> 
> An excerpt of the trace:
> > [  +0,000005] WARNING: CPU: 10 PID: 0 at drivers/iommu/intel-iommu.c:3916 bounce_unmap_single+0x103/0x110
> > [...]
> > [  +0,000001] Call Trace:
> > [  +0,000002]  <IRQ>
> > [  +0,000003]  usb_hcd_unmap_urb_setup_for_dma+0x9f/0xe0
> > [  +0,000001]  usb_hcd_unmap_urb_for_dma+0x1c/0x170
> > [  +0,000002]  __usb_hcd_giveback_urb+0x36/0x120
> > [  +0,000008]  xhci_giveback_urb_in_irq.isra.0+0x72/0x100 [xhci_hcd]
> > [  +0,000007]  xhci_td_cleanup+0x101/0x140 [xhci_hcd]
> > [  +0,000007]  xhci_irq+0xbf0/0x1db0 [xhci_hcd]
> > [  +0,000005]  __handle_irq_event_percpu+0x44/0x1b0
> > [  +0,000002]  handle_irq_event_percpu+0x34/0x80
> > [  +0,000002]  handle_irq_event+0x37/0x54
> > [  +0,000002]  handle_edge_irq+0xae/0x1f0
> > [  +0,000002]  do_IRQ+0x84/0x140
> > [  +0,000003]  common_interrupt+0xf/0xf
> > [  +0,000001]  </IRQ>
> 
> Dmesg log and further information have been posted here: https://bugzilla.kernel.org/show_bug.cgi?id=205893
> 
> Cheers,
> Frederik
> 



_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
