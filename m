Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B11639B8C
	for <lists.iommu@lfdr.de>; Sat,  8 Jun 2019 09:29:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D74841E2B;
	Sat,  8 Jun 2019 07:29:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 092A91DEA
	for <iommu@lists.linux-foundation.org>;
	Sat,  8 Jun 2019 07:28:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 959D1844
	for <iommu@lists.linux-foundation.org>;
	Sat,  8 Jun 2019 07:28:19 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id C603868B02; Sat,  8 Jun 2019 09:27:51 +0200 (CEST)
Date: Sat, 8 Jun 2019 09:27:51 +0200
From: "hch@lst.de" <hch@lst.de>
To: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
Subject: Re: Device specific pass through in host systems - discuss user
	interface
Message-ID: <20190608072751.GA18928@lst.de>
References: <FFF73D592F13FD46B8700F0A279B802F48DA796E@ORSMSX114.amr.corp.intel.com>
	<3fa16135-b2bb-03b5-833a-bce8cc68f35f@arm.com>
	<12f8c572074b7963705ba066fdde0f9fdf0bfc62.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <12f8c572074b7963705ba066fdde0f9fdf0bfc62.camel@intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Shankar, Ravi V" <ravi.v.shankar@intel.com>, "Tian,
	Kevin" <kevin.tian@intel.com>, "jroedel@suse.de" <jroedel@suse.de>, "Raj,
	Ashok" <ashok.raj@intel.com>, Will Deacon <will.deacon@arm.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"Pan, Jacob jun" <jacob.jun.pan@intel.com>,
	Robin Murphy <robin.murphy@arm.com>, "hch@lst.de" <hch@lst.de>,
	"Lu, Baolu" <baolu.lu@intel.com>
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

Just curious, what exactly is the use case?  Explaining how someone
would wan to use this should drive the way we design an interface for it.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
