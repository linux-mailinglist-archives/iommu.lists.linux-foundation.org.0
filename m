Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7865F3B517
	for <lists.iommu@lfdr.de>; Mon, 10 Jun 2019 14:32:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9A4D8C5C;
	Mon, 10 Jun 2019 12:32:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AEF6F255
	for <iommu@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 12:32:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1A01D174
	for <iommu@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 12:32:50 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 4360268B02; Mon, 10 Jun 2019 14:32:22 +0200 (CEST)
Date: Mon, 10 Jun 2019 14:32:22 +0200
From: Christoph Hellwig <hch@lst.de>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: How to resolve an issue in swiotlb environment?
Message-ID: <20190610123222.GA20985@lst.de>
References: <OSAPR01MB3089B381AF2F687526E63EEAD8140@OSAPR01MB3089.jpnprd01.prod.outlook.com>
	<OSAPR01MB3089D50DBDAA6C7D427E72EED8100@OSAPR01MB3089.jpnprd01.prod.outlook.com>
	<OSAPR01MB3089BCA7CF78D6E4D9C83E1BD8130@OSAPR01MB3089.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OSAPR01MB3089BCA7CF78D6E4D9C83E1BD8130@OSAPR01MB3089.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Alan Stern <stern@rowland.harvard.edu>, Christoph Hellwig <hch@lst.de>
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

Hi Yoshihiro,

sorry for not taking care of this earlier, today is a public holiday
here and thus I'm not working much over the long weekend.

On Mon, Jun 10, 2019 at 11:13:07AM +0000, Yoshihiro Shimoda wrote:
> I have another way to avoid the issue. But it doesn't seem that a good way though...
> According to the commit that adding blk_queue_virt_boundary() [3],
> this is needed for vhci_hcd as a workaround so that if we avoid to call it
> on xhci-hcd driver, the issue disappeared. What do you think?
> JFYI, I pasted a tentative patch in the end of email [4].

Oh, I hadn't even look at why USB uses blk_queue_virt_boundary, and it
seems like the usage is wrong, as it doesn't follow the same rules as
all the others.  I think your patch goes in the right direction,
but instead of comparing a hcd name it needs to be keyed of a flag
set by the driver (I suspect there is one indicating native SG support,
but I can't quickly find it), and we need an alternative solution
for drivers that don't see like vhci.  I suspect just limiting the
entire transfer size to something that works for a single packet
for them would be fine.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
