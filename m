Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D64C3041
	for <lists.iommu@lfdr.de>; Tue,  1 Oct 2019 11:32:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B22487D87;
	Tue,  1 Oct 2019 09:32:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9A6E17B9F
	for <iommu@lists.linux-foundation.org>;
	Tue,  1 Oct 2019 09:32:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id F11FF8A0
	for <iommu@lists.linux-foundation.org>;
	Tue,  1 Oct 2019 09:32:17 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Oct 2019 02:32:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,570,1559545200"; d="scan'208";a="205031844"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
	by fmsmga001.fm.intel.com with SMTP; 01 Oct 2019 02:32:13 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 01 Oct 2019 12:32:12 +0300
Date: Tue, 1 Oct 2019 12:32:12 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/6] ACPI / utils: Describe function parameters in
	kernel-doc
Message-ID: <20191001093212.GF2714@lahna.fi.intel.com>
References: <20190924193739.86133-1-andriy.shevchenko@linux.intel.com>
	<20190924193739.86133-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190924193739.86133-2-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org
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

On Tue, Sep 24, 2019 at 10:37:34PM +0300, Andy Shevchenko wrote:
> Kernel documentation script complains that some of the function parameters
> are not described:
> 
> drivers/acpi/utils.c:462: warning: Function parameter or member 'handle' not described in 'acpi_handle_path'
> drivers/acpi/utils.c:484: warning: Function parameter or member 'level' not described in 'acpi_handle_printk'
> drivers/acpi/utils.c:484: warning: Function parameter or member 'handle' not described in 'acpi_handle_printk'
> drivers/acpi/utils.c:484: warning: Function parameter or member 'fmt' not described in 'acpi_handle_printk'
> drivers/acpi/utils.c:513: warning: Function parameter or member 'descriptor' not described in '__acpi_handle_debug'
> drivers/acpi/utils.c:513: warning: Function parameter or member 'handle' not described in '__acpi_handle_debug'
> drivers/acpi/utils.c:513: warning: Function parameter or member 'fmt' not described in '__acpi_handle_debug'
> 
> Describe function parameters where it's appropriate.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
