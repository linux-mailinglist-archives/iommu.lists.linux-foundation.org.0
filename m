Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D33B341C27
	for <lists.iommu@lfdr.de>; Wed, 12 Jun 2019 08:24:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7A4F61590;
	Wed, 12 Jun 2019 06:24:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 799831585
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 06:22:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2089679
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 06:22:34 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jun 2019 23:22:32 -0700
X-ExtLoop1: 1
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
	by fmsmga001.fm.intel.com with SMTP; 11 Jun 2019 23:22:26 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 12 Jun 2019 09:22:25 +0300
Date: Wed, 12 Jun 2019 09:22:25 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v4 0/9] iommu: Bounce page for untrusted devices
Message-ID: <20190612062225.GM2640@lahna.fi.intel.com>
References: <20190603011620.31999-1-baolu.lu@linux.intel.com>
	<20190610154241.GS28796@char.us.oracle.com>
	<cd66dab1-9a18-13c1-e668-417036e2dbc1@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cd66dab1-9a18-13c1-e668-417036e2dbc1@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>, kevin.tian@intel.com,
	Stefano Stabellini <sstabellini@kernel.org>, ashok.raj@intel.com,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	alan.cox@intel.com, Jonathan Corbet <corbet@lwn.net>,
	Robin Murphy <robin.murphy@arm.com>, Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	pengfei.xu@intel.com, Ingo Molnar <mingo@redhat.com>,
	jacob.jun.pan@intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>
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

On Wed, Jun 12, 2019 at 11:00:06AM +0800, Lu Baolu wrote:
> > What kind of devices did you test it with?
> 
> Most test work was done by Xu Pengfei (cc'ed). He has run the code
> on real platforms with various thunderbolt peripherals (usb, disk,
> network, etc.).

In addtition to that we are also in works to build a real thunderclap
platform to verify it can only access the bounce buffer if the DMA
transfer was to a memory not filling the whole page.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
