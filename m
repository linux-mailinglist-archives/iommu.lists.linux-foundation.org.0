Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A56D45B75E
	for <lists.iommu@lfdr.de>; Mon,  1 Jul 2019 10:59:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 56FC0714C;
	Mon,  1 Jul 2019 08:59:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2C6B07142
	for <iommu@lists.linux-foundation.org>;
	Mon,  1 Jul 2019 08:59:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C1725832
	for <iommu@lists.linux-foundation.org>;
	Mon,  1 Jul 2019 08:59:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id E20E3AD2A;
	Mon,  1 Jul 2019 08:59:46 +0000 (UTC)
Date: Mon, 1 Jul 2019 10:59:44 +0200
From: "jroedel@suse.de" <jroedel@suse.de>
To: "Prakhya, Sai Praneeth" <sai.praneeth.prakhya@intel.com>
Subject: Re: Device specific pass through in host systems - discuss user
	interface
Message-ID: <20190701085944.GB3131@suse.de>
References: <FFF73D592F13FD46B8700F0A279B802F48DA796E@ORSMSX114.amr.corp.intel.com>
	<b7a71b22-aa3b-5ac3-7285-5231f84ee979@intel.com>
	<FFF73D592F13FD46B8700F0A279B802F48DD2A02@ORSMSX114.amr.corp.intel.com>
	<20190610135617.GA27166@araj-mobl1.jf.intel.com>
	<FFF73D592F13FD46B8700F0A279B802F48DE19EC@ORSMSX114.amr.corp.intel.com>
	<20190611045614.GB6469@araj-mobl1.jf.intel.com>
	<FFF73D592F13FD46B8700F0A279B802F48DE94B3@ORSMSX114.amr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <FFF73D592F13FD46B8700F0A279B802F48DE94B3@ORSMSX114.amr.corp.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Shankar, Ravi V" <ravi.v.shankar@intel.com>, "Tian,
	Kevin" <kevin.tian@intel.com>, "Raj,
	Ashok" <ashok.raj@intel.com>, Will Deacon <will.deacon@arm.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"Pan, Jacob jun" <jacob.jun.pan@intel.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"hch@lst.de" <hch@lst.de>, "Lu, Baolu" <baolu.lu@intel.com>
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

On Tue, Jun 11, 2019 at 05:27:15PM +0000, Prakhya, Sai Praneeth wrote:
> 1. Since we already have "type" file, which is "read-only", we could make it R/W.
> 
> The present value shows the existing type of default domain.
> If user wants to change it (Eg: from DMA to IDENTITY or vice versa), he attempts to write the new value.
> Kernel performs checks to make sure that the driver in unbinded and it's safe to change the default domain type.
> After successfully changing the default_domain type internally, kernel reflects the new value in the file.
> Ay errors in the process will be reported in dmesg.

I prefer this way. Writing to the file should fail with -EBUSY when it
is not safe to change the default domain-type. Writing should only
succeed when no device in the group is assigned to a device driver.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
